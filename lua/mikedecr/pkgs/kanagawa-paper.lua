return {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("kanagawa-paper")
        vim.cmd "colorscheme kanagawa-paper"
    end
}
