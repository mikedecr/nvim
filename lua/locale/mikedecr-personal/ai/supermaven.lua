vim.pack.add({
    "https://github.com/supermaven-inc/supermaven-nvim",
})

require("supermaven-nvim").setup({
    ignore_filetypes = { "oil" },
    disable_inline_completion = false,
    disable_keymaps = false,
    keymaps = {
        accept_suggestion = "<C-f>",
        accept_word = "<C-n>",
        clear_suggestion = "<C-b>",
    }
})
