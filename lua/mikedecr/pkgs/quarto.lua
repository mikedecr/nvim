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
    end
  },
}
