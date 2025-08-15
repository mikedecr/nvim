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
    end
  },
}
