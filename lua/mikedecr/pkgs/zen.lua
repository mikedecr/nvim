return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<space>zm", "<cmd>ZenMode<cr>")
    end
}
