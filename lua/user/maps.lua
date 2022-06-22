-----------------------------------------------------
-- ::: VARIABLES / ALIASES :::

-- fn to write a map
local keymap = vim.api.nvim_set_keymap

-- list of map options
local opts = {noremap = true, silent = true}


-----------------------------------------------------
-- ::: NORMAL :::

-- telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-----------------------------------------------------
-- ::: TERMINAL :::

-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

