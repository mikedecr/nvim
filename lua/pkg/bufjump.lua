vim.pack.add({
    "https://github.com/kwkarlwang/bufjump.nvim"
})

local b = require("bufjump")
b.setup({
    forward = "<C-n>",
    backward = "<C-p>",
    on_success = nil
})
