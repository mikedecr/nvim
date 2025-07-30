vim.pack.add({
    "https://github.com/supermaven-inc/supermaven-nvim",
})

require("supermaven-nvim").setup({
    ignore_filetypes = { "oil" },
    disable_inline_completion = false,
    disable_keymaps = true,
    keymaps = {
        accept_suggestion = "<C-f>"
    }
})
