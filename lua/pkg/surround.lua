vim.pack.add({
    'https://github.com/echasnovski/mini.surround',
})

local surround = require("mini.surround")
surround.setup({
    mappings = {
        highlight = "ss"
    }
})
