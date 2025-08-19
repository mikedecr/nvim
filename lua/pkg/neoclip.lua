-- clipboard history
vim.pack.add({
    "https://github.com/AckslD/nvim-neoclip.lua",
    "https://github.com/nvim-telescope/telescope.nvim",
})

require("pkg.telescope")
require("neoclip").setup()

vim.keymap.set("n", "<SPACE>fy", "<cmd>Telescope neoclip<CR>")
