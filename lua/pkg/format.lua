vim.pack.add({
    "https://github.com/stevearc/conform.nvim"
})


local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        python = {
          "ruff_fix",  -- lint errors
          "ruff_format",  -- stringly formatting
          "ruff_organize_imports",
        },
    }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    conform.format({ bufnr = args.buf })
  end,
})
