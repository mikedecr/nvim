vim.pack.add({"https://github.com/stevearc/oil.nvim"})

require("oil").setup({
    keymaps = {
        ["<C-p>"] = false,
        ["<Space>v"] = "actions.preview"
    },
    columns = {"icon", "size", "mtime"}
})

vim.keymap.set("n", "<space>od", "<CMD>Oil<CR>", { desc = "Open Oil" })
