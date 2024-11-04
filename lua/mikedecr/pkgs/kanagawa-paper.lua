return {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        local kp = require("kanagawa-paper")
        kp.setup({
            overrides = function(colors)
                local m = {
                    -- reverse selected and non-selected tab dimness
                    TabLine = { fg = colors.theme.syn.comment, bg = colors.theme.ui.bg_p1 },
                    TabLineSel = { fg = colors.theme.ui.special, bg = colors.theme.ui.bg_tabline }
                }
                return m
            end
        })
        vim.cmd "colorscheme kanagawa-paper"
    end
}
