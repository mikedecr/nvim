vim.pack.add({
    "https://github.com/quarto-dev/quarto-nvim",
    "https://github.com/jmbuhr/otter.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("quarto").setup({
    codeRunner = {
        default_method = "slime",
    },
    -- auto-activates otter.nvim for quarto buffers, which exposes
    -- embedded-language LSP completions through blink.cmp's "lsp" source.
    lspFeatures = {
        enabled = true,
        chunks = "curly",
        languages = { "r", "python", "julia", "bash", "html" },
        completion = { enabled = true },
        diagnostics = { enabled = true, triggers = { "BufWritePost" } },
    },
})

local opts = { silent = true }
vim.keymap.set("n", "]c", "/```{<CR>", opts)
vim.keymap.set("n", "[c", "?```{<CR>", opts)
vim.keymap.set("n", "<space>ru", "<CMD>QuartoSendAbove<CR>", opts)
vim.keymap.set("n", "<space>rb", "<CMD>QuartoSendBelow<CR>", opts)
vim.keymap.set("n", "<space>ra", "<CMD>QuartoSendAll<CR>", opts)
