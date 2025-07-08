-- disable some annoying Python LSP when we are in quarto / otter buffer mode

local lsp = require("lspconfig")

lsp.pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {
                        "E251",
                        "E306",
                        "E303", -- too many blank lines
                    },
                    maxLineLength = 120 -- people are so needlessly opinionated about this
                }
            }
        }
    }
})
