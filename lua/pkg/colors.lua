vim.pack.add({
    "https://github.com/sho-87/kanagawa-paper.nvim",
    "https://github.com/EdenEast/nightfox.nvim",
    "https://github.com/neanias/everforest-nvim",
    "https://github.com/everviolet/nvim",
    "https://github.com/zekzekus/menguless",
    "https://github.com/rjshkhr/shadow.nvim",
    "https://github.com/ramojus/mellifluous.nvim",
    "https://gitlab.com/motaz-shokry/gruvbox.nvim",
    -- minimal
    "https://github.com/hardselius/warlock",
    "https://github.com/karoliskoncevicius/distilled-vim",
    "https://github.com/andreypopp/vim-colors-plain",
    "https://github.com/Alligator/accent.vim",
    "https://github.com/nvim-mini/mini.hues"
})

require("kanagawa-paper").setup({
    terminal_colors = true
})
vim.cmd("colorscheme accent")
