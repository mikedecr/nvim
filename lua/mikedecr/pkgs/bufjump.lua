return {
    'kwkarlwang/bufjump.nvim',
    config = function()
        local b = require("bufjump")
        b.setup({
            forward = "<C-n>",
            backward = "<C-p>",
            on_success = nil
        })
    end
}

