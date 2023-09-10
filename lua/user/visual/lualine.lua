local ll_ok, lualine = pcall(require, "lualine")
if not ll_ok then vim.notify('failed: lualine') return end

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

-- closure trick, cond attribute expectes a function
-- so we pass a param and return a fn that encloses the param
local show_above_width = function(w)
	return function()
        return vim.fn.winwidth(0) > w
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

local spaces = function()
    local width = vim.api.nvim_buf_get_option(0, "shiftwidth")
	return "\\t=" .. width
end

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
        lualine_y = { filetype, spaces },
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

