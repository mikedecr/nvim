return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")
        -- several defaults deleted, see <https://github.com/lewis6991/gitsigns.nvim>w
        gs.setup {
          signs = {
              add          = { text = "+", },
              change       = { text = "~", },
              delete       = { text = "_", },
              topdelete    = { text = "‾", },
              changedelete = { text = "~", },
          },
          numhl = true,
          linehl = true,     -- man... idk. this is annoying which is maybe good, keeps the changes contained?
        }
    end
}
