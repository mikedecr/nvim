return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local qmd = require("quarto")
        qmd.setup({
            codeRunner = {
                enabled = false
            }
        })
        local send_visual = "<Cmd>execute 'set operatorfunc=repl#noop'<CR>:<C-u>call repl#sendvisual(visualmode())<CR>g@l<Cmd>execute 'set operatorfunc=repl#sendline'<CR>"

        local opts = { silent = true }
        vim.keymap.set("n", "]c", "/```{<CR>", opts)
        vim.keymap.set("n", "[c", "?```{<CR>", opts)
        vim.keymap.set("n", "<space>rc", "vic" .. send_visual .. "]c", opts)
    end
  },
}
