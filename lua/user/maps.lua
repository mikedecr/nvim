-----------------------------------------------------
-- ::: VARIABLES / ALIASES :::

local keymap = vim.api.nvim_set_keymap          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options


-----------------------------------------------------
-- ::: NORMAL :::

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- telescope
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- tree
keymap("n", "<leader>e", ":NeoTreeFocus<cr>", opts)

-- select rmd/qmd chunk
keymap("n", "vic", "/```<cr>NjVnk", opts) -- select chunk contents
keymap("n", "vik", "/```<cr>NVn", opts)   -- select chunk + delimiters


-----------------------------------------------------
-- ::: TERMINAL :::

-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

