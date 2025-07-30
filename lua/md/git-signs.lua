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
    numhl = false,
    -- man... idk. this is annoying which is maybe good, keeps the changes contained?
    linehl = false,
})
