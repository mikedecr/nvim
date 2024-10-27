return {
    'echasnovski/mini.surround',
    config = function()
        local surround = require("mini.surround")
        surround.setup({
            mappings = {
                highlight = "ss"
            }
        })
    end
}

