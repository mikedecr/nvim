local ll_ok, lualine = pcall(require, "lualine")

if not ll_ok then
    vim.notify('lualine broken')
    return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "(+)", modified = "(Δ)", removed = "(-)" }, -- changes diff symbols
    cond = hide_in_width
}

-- local mode = {
-- 	"mode",
-- 	fmt = function(str)
-- 		return "" .. str .. " "
-- 	end,
-- }


local filetype = {
	"filetype",
    fmt = function(str) return '(' .. str .. ')' end,
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}


local spaces = function()
    local width = vim.api.nvim_buf_get_option(0, "shiftwidth")
	return "tab = " .. width
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
	extensions = {},
})

