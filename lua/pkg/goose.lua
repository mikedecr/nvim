vim.pack.add({
    "https://github.com/azorng/goose.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    -- "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

-- implicitly using ~/.config/goose config?
require("goose").setup({})
