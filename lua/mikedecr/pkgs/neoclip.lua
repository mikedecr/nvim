-- clipboard history
return {
    "AckslD/nvim-neoclip.lua",
    depencencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('neoclip').setup()
    end,
}
