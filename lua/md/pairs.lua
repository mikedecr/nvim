-- this provides basic pair completion, really.
-- LLM completion makes somewhat obsolete, but still
vim.pack.add({
    "https://github.com/windwp/nvim-autopairs"
})

require("nvim-autopairs").setup()
