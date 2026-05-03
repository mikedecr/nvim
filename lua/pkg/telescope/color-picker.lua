-- custom colorscheme picker: shows the providing plugin next to each scheme,
-- previews on selection move, restores on cancel.
-- opts.ignore_builtins (boolean, default false): hide Neovim's bundled schemes.
-- opts.sort_by ("name" | "plugin", default "name"): sort order in the list.
local installed_colorschemes = function(opts)
    opts = opts or {}
    local sort_by = opts.sort_by or "name"
    local pickers        = require("telescope.pickers")
    local finders        = require("telescope.finders")
    local previewers     = require("telescope.previewers")
    local conf           = require("telescope.config").values
    local actions        = require("telescope.actions")
    local action_state   = require("telescope.actions.state")
    local entry_display  = require("telescope.pickers.entry_display")

    local builtin_names = {
        blue=true, darkblue=true, default=true, delek=true, desert=true,
        elflord=true, evening=true, habamax=true, industry=true, koehler=true,
        lunaperche=true, morning=true, murphy=true, pablo=true, peachpuff=true,
        quiet=true, retrobox=true, ron=true, shine=true, slate=true,
        sorbet=true, torte=true, vim=true, wildcharm=true, zaibatsu=true, zellner=true,
    }

    -- map colorscheme name -> source label (plugin dir, "builtin", or "config")
    local sources = {}
    for _, f in ipairs(vim.fn.globpath(vim.o.runtimepath, "colors/*", false, true)) do
        local name = vim.fn.fnamemodify(f, ":t:r")
        if not sources[name] then -- first match on rtp wins (Vim's resolution order)
            local plugin = f:match("/pack/[^/]+/[^/]+/([^/]+)/colors/")
            if builtin_names[name] then
                sources[name] = "builtin"
            elseif plugin then
                sources[name] = plugin
            elseif vim.env.VIMRUNTIME and vim.startswith(f, vim.env.VIMRUNTIME) then
                sources[name] = "builtin"
            elseif vim.startswith(f, vim.fn.stdpath("config")) then
                sources[name] = "config"
            else
                sources[name] = vim.fn.fnamemodify(f, ":h:h:t")
            end
        end
    end

    local before_background = vim.o.background
    local before_color      = vim.api.nvim_exec2("colorscheme", { output = true }).output
    local need_restore      = true

    local results = vim.fn.getcompletion("", "color")
    if opts.ignore_builtins then
        results = vim.tbl_filter(function(c) return not builtin_names[c] end, results)
    end
    table.sort(results, function(a, b)
        -- always pin the active colorscheme at the top
        if a == before_color then return true end
        if b == before_color then return false end
        if sort_by == "plugin" then
            local sa = sources[a] or "~" -- "~" sorts after letters, pushing unknowns last
            local sb = sources[b] or "~"
            if sa ~= sb then return sa < sb end
        end
        return a < b
    end)

    local max_name = 0
    for _, n in ipairs(results) do
        if #n > max_name then max_name = #n end
    end

    local displayer = entry_display.create({
        separator = "  ",
        items = { { width = max_name }, { remaining = true } },
    })

    -- previewer: show the current buffer's contents (recolored live by set_selection below)
    local cur_buf  = vim.api.nvim_get_current_buf()
    local cur_path = vim.api.nvim_buf_get_name(cur_buf)
    local previewer = previewers.new_buffer_previewer({
        title = "Preview",
        get_buffer_by_name = function() return cur_path end,
        define_preview = function(self)
            if cur_path ~= "" and vim.uv.fs_stat(cur_path) then
                conf.buffer_previewer_maker(cur_path, self.state.bufnr,
                    { bufname = self.state.bufname })
            else
                local lines = vim.api.nvim_buf_get_lines(cur_buf, 0, -1, false)
                vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
            end
        end,
    })

    local picker = pickers.new({}, {
        prompt_title = "Colorschemes  (name  ←  source)",
        finder = finders.new_table({
            results = results,
            entry_maker = function(name)
                local src = sources[name] or "(dynamic)"
                return {
                    value   = name,
                    ordinal = src .. " " .. name,
                    display = function()
                        return displayer({ name, { src, "Comment" } })
                    end,
                }
            end,
        }),
        sorter    = conf.generic_sorter({}),
        previewer = previewer,
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                if not selection then return end
                need_restore = false
                actions.close(prompt_bufnr)
                vim.cmd.colorscheme(selection.value)
            end)
            return true
        end,
    })

    -- live preview on selection move
    local set_selection = picker.set_selection
    picker.set_selection = function(self, row)
        set_selection(self, row)
        local selection = action_state.get_selected_entry()
        if selection then pcall(vim.cmd.colorscheme, selection.value) end
    end

    -- restore on cancel
    local close_windows = picker.close_windows
    picker.close_windows = function(status)
        close_windows(status)
        if need_restore then
            vim.o.background = before_background
            pcall(vim.cmd.colorscheme, before_color)
        end
    end

    picker:find()
end
vim.keymap.set("n", "<space>fc",
    function() installed_colorschemes({ ignore_builtins = true, sort_by = "plugin" }) end,
    {desc = "Tele: colorscheme"})

