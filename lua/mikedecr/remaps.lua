local keymap = vim.keymap.set

-- noremap is default, but nice to be explicit
local opts = { noremap = true, silent = true }


-- :::: NORMAL ::::

-- yank to clipboard
-- there is a delicate setup here.
-- This map lets me write to system (which can be fwd'd over ssh)
-- but kitty term may ask before reading from system clipboard
-- not a problem...I can manually paste text w/ OS keymap
keymap("n", "<Space>y", '"+y', opts)
keymap("v", "<Space>y", '"+y', opts)

-- Better buffer split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- resize splits
-- keymap("n", "<C-Up>", "<cmd>resize +2<cr>", {desc = "Increase window height"})
-- keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- source file
keymap("n", "<Space>sof", "<Cmd>source %<Enter>", { desc = "Source current file" })

-- clear line in normal mode
keymap("n", "dc", "0D", { desc = "Delete text from line" })

-- Better buffer split navigation
-- s+ or t+ ?
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts) -- C-k would conflict w/ LSP somehow...
keymap("n", "sl", "<C-w>l", opts)


-- :::: TERMINAL ::::

-- exit terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
