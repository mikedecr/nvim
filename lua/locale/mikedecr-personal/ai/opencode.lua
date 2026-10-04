vim.pack.add({
    "https://github.com/nickjvandyke/opencode.nvim",
})

-- auto-reload buffers on changes
vim.o.autoread = true

vim.keymap.set({ "n", "x" }, "<space>cs", function() require("opencode").ask("@this: ") end, { desc = "Ask opencode..." })
vim.keymap.set({ "n", "x" }, "<space>cx", function() require("opencode").select() end, { desc = "Execute opencode action..." })

-- No plugin API for this: `toggle()` was removed with the bundled terminal manager.
vim.keymap.set({ "n" }, "<space>co", "<cmd>vsplit term://opencode<cr>", { desc = "Open opencode TUI" })
