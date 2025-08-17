vim.pack.add({
    "https://github.com/sho-87/kanagawa-paper.nvim",
    "https://github.com/EdenEast/nightfox.nvim",
    "https://github.com/neanias/everforest-nvim",
})

local everforest = require("everforest")
everforest.setup({
    background = "medium",
    dim_inactive_windows = true
})

everforest.load()
