vim.pack.add({
    "https://github.com/nickjvandyke/opencode.nvim",
})

-- auto-reload buffers on changes
vim.o.autoread = true

vim.opencode_opts = {}

-- vim.keymap.set({ "n", "x" }, "<leader>ca", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode..." })
vim.keymap.set({ "n", "x" }, "<leader>cx", function() require("opencode").select() end, { desc = "Execute opencode action..." })
vim.keymap.set({ "n", "t" }, "<leader>co", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
