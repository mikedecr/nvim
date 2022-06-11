-----------------------------------------------------
-- ::: VARIABLES / ALIASES :::

-- fn to write a map
local keymap = vim.api.nvim_set_keymap

-- list of map options
local opts = {noremap = true, silent = true}


-----------------------------------------------------
-- ::: TERMINAL :::

-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

