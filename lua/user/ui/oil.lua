local ok, oil = pcall(require, "oil")
if not ok then vim.notify("failed: oil") return end

oil.setup({
    keymaps = {
        ["C-p"] = false,
        ["<Space>v"] = "actions.preview"
    }
})

vim.keymap.set("n", "<space>od", "<CMD>Oil<CR>", { desc = "Open Oil" })

