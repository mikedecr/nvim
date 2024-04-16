local keymap = vim.keymap.set

-- noremap is default, but nice to be explicit
local opts = { noremap = true, silent = true }


-- :::: NORMAL ::::

-- convenient write
keymap("n", "<Space>w", "<cmd>w<enter>", { desc = "Write file" })
keymap("n", "<Space>q", "<cmd>q<enter>", { desc = "Quit file" })

-- there is a delicate setup here.
-- This map lets me write to system (which can be fwd'd over ssh)
-- but kitty term may ask before reading from system clipboard
-- not a problem...I can manually paste text w/ OS keymap

-- yank to clipboard
-- terminal may separately give you trouble trying to read clipboard
keymap("n", "<Space>y", '"+y', opts)
keymap("v", "<Space>y", '"+y', opts)

-- Better buffer split navigation
-- these used to be sh, sj, etc. but this (regrettably) matches jupyter better
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

-- resize splits
keymap("n", "<C-k>", "<cmd>resize +2<cr>", {desc = "Increase window height"})
keymap("n", "<C-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- source file
keymap("n", "<Space>sof", "<Cmd>source %<Enter>", { desc = "Source current file" })

-- clear line in normal mode
keymap("n", "dc", "0D", { desc = "Delete text from line" })


-- :::: VISUAL ::::

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)


-- :::: TERMINAL ::::

-- exit terminal mode
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })