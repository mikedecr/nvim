return {
    'echasnovski/mini.surround',
    config = function()
        surround = require("mini.surround")
        surround.setup({
            mappings = {
                highlight = "ss"
            }
        })
    end
}

