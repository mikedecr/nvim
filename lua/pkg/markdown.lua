vim.pack.add({
    "https://github.com/MeanderingProgrammer/render-markdown.nvim"
})

-- we want to draw some things as wide as the vertical ruler
local colorcol_value = tonumber(vim.opt.colorcolumn._value)

require("render-markdown").setup({
    file_types = { 'markdown', 'quarto', 'avante' },
    enable = false,
    render_modes = true,
    code = {
        sign = false,
        language = true,
        language_info = true,
        language_icon = false,
        language_pad = 0,
        width = "block",
        min_width = colorcol_value,
        border = "thick", -- full height of delimited area
        conceal_delimiters = false,
    },
    heading = {
        position = "inline",
        icons = false,
        width = "block",
        min_width = colorcol_value,
    },
    html = {
        comment = {
            conceal = false,
        }
    }
})

