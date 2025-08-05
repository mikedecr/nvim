vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
})

-- several defaults deleted;
-- see <https://github.com/lewis6991/gitsigns.nvim>
local gs = require("gitsigns")
gs.setup({
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
