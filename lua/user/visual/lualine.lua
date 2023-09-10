local ll_ok, lualine = pcall(require, "lualine")
if not ll_ok then vim.notify('failed: lualine') return end


------------------------------------------------------------------
--    lib: manage status line items as variables / functions    --
------------------------------------------------------------------

-- Lualine expects tables for each "slot" in the status line.
-- This section pops out the table content into locals to separate out the noise.

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

-- closure trick: `cond` table entry expectes a function.
-- but we want to pass an arg, so we enclose / curry it
local show_above_width = function(w)
	return function()
        -- cur_width is local to the calling context
        local current_window_width = vim.fn.winwidth(0)
        return current_window_width > w
    end
end

local diff = {
	"diff",
	colored = true,
	symbols = { added = "+", modified = "∆", removed = "-" }, -- changes diff symbols
    cond = show_above_width(60)
}

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info" },
	symbols = { error = "x", warn = "!" },
	colored = true,
	update_in_insert = false,
	always_visible = false
}

local filetype = {
	"filetype",
    fmt = function(str) return '[' .. str .. ']' end,
	icons_enabled = false,
	icon = nil,
}

local tab_spaces = function()
    local width = vim.api.nvim_buf_get_option(0, "shiftwidth")
	return "\\t=" .. width
end


-----------------------------------
--    implement configuration    --
-----------------------------------

-- suppress MODE from the builtin cmd line.
-- Custom statusline will show it.
vim.opt.showmode = false

lualine.setup({
	options = {
		theme = "auto",
		icons_enabled = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		always_divide_middle = true,
		disabled_filetypes = { "dashboard", "neo-tree", "NvimTree", "Outline" },
	},
	sections = {
        lualine_a = { "mode" },
		lualine_b = {'filename'},
		lualine_c = { branch, diff },
		lualine_d = {},
		lualine_x = { diagnostics },
        lualine_y = { filetype, tab_spaces },
		lualine_z = { 'location' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
    -- winbar = { 
    --     lualine_a = {"filename"},
    --     lualine_b = {diff},
    -- },
    -- inactive_winbar = {
    --     lualine_a = {"filename"}
    -- },
	extensions = {},
})

