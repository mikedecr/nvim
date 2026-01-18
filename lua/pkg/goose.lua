vim.pack.add({
    "https://github.com/azorng/goose.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("goose").setup({
    default_global_keymaps = false,
    keymap = {
        global = {
            toggle = "<space>gg",
            toggle_fullscreen = '<leader>gf',
        },
        window = {
            submit_insert = "<C-s>",
            submit = "<C-s>",
        }
    },
    ui = {
        window_type = "split"
    }
})
