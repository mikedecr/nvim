-- :::::::::::::::::::
-- :::: telescope ::::
-- :::::::::::::::::::

-- extensible fuzzy finder

local tele_ok, telescope = pcall(require, "telescope")
if not tele_ok then vim.notify('failed: telescope'); return; end

local actions_ok, actions = pcall(require, 'telescope.actions')
if not actions_ok then vim.notify('failed: telescope.actions'); return; end


telescope.setup {
  defaults = {

    -- Visual display of the picker
    pickers = {
        find_files =  { theme = "ivy" },
        oldfiles =    { theme = "dropdown" },
        projects =    { theme = "dropdown" },
        live_grep =   { theme = "ivy" },
        git_commits = { theme = "ivy" }
    },
    prompt_prefix = "? > ",
    selection_caret = "-> ",
    path_display = { "smart" },

    -- keymaps by mode
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        -- navigate search list
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        -- toggle selections (not entirely sure I understand...)
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

        -- selection from / exit search list
        ["<C-c>"] = actions.close,
        ["<CR>"] = actions.select_default,
        -- select into a buffer split, tab, etc.
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        -- preview buffer
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        -- quick fix list etc.
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {

        -- navigate 
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        -- preview buffer
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        -- selection / exit
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        -- toggle selection
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,

        -- qfix list etc
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["?"] = actions.which_key,
                --
        -- drag options
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

      },
    },
  },

}

-- ::: setup media files :::

telescope.load_extension('media_files')
local media_files_setup = {
    -- filetypes whitelist
    -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
    filetypes = {"png", "webp", "jpg", "jpeg"},
    find_cmd = {"rg", "-L"} -- find command (defaults to `fd`)
}

-- Your extension configuration goes here:
-- extension_name = {
--   extension_config_key = value,
-- }
-- see readme for your desired extension
telescope.setup {
  extensions = {
    media_files = media_files_setup,
  }
}


