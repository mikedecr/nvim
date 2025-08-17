vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/tpope/vim-fugitive",
})

-- several defaults deleted;
-- see <https://github.com/lewis6991/gitsigns.nvim>
local gitsigns = require("gitsigns")
gitsigns.setup({
    signs = {
        add          = { text = "+", },
        change       = { text = "~", },
        delete       = { text = "_", },
        topdelete    = { text = "‾", },
        changedelete = { text = "~", },
    },
    numhl = true,
    linehl = false,
})
