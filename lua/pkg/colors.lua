vim.pack.add({
    "https://github.com/sho-87/kanagawa-paper.nvim",
    "https://github.com/EdenEast/nightfox.nvim",
    "https://github.com/neanias/everforest-nvim",
    "https://github.com/everviolet/nvim",
    "https://github.com/zekzekus/menguless",
    "https://github.com/rjshkhr/shadow.nvim"
})

require("kanagawa-paper").setup({
    terminal_colors = true
})
vim.cmd("colorscheme kanagawa-paper-ink")
