vim.pack.add({
    "https://github.com/quarto-dev/quarto-nvim",
    "https://github.com/jmbuhr/otter.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

-- need explicit otter req bc I think my quarto version is too old?
-- https://github.com/quarto-dev/quarto-nvim/issues/187
require("otter").setup()

local qmd = require("quarto")
qmd.setup({
    codeRunner = {
        enabled = true,
        default_method="slime"
    }
})
local opts = { silent = true }
vim.keymap.set("n", "]c", "/```{<CR>", opts)
vim.keymap.set("n", "[c", "?```{<CR>", opts)
vim.keymap.set("n", "<space>ru", "<CMD>QuartoSendAbove<CR>", opts)
vim.keymap.set("n", "<space>rb", "<CMD>QuartoSendBelow<CR>", opts)
vim.keymap.set("n", "<space>ra", "<CMD>QuartoSendAll<CR>", opts)
