vim.pack.add({"https://github.com/folke/zen-mode.nvim"})


local zen = require("zen-mode")

zen.setup({
    window = {
        backdrop = 1,
        width = 150,
        height = .98
    }
})
