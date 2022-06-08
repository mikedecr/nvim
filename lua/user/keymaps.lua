local opts = {noremap = true, silent = true}
local keymap = vim.api.nvim_set_keymap

-- TERMINAL --
-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

