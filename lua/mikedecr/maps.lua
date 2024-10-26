local keymap = vim.keymap.set

-- noremap is default, but nice to be explicit
local opts = { noremap = true, silent = true }


-- :::: NORMAL ::::

-- edit config
vim.keymap.set("n", "<space>cc", ":e ~/.config/nvim<CR>")

-- write & quit
keymap("n", "<Space>ww", "<cmd>w<enter>", { desc = "Write file" })
keymap("n", "<Space>qq", "<cmd>q<enter>", { desc = "Quit file" })
keymap("n", "<Space>wq", "<cmd>wq<enter>", { desc = "Quit file" })
keymap("n", "<Space>qf", "<cmd>q!<enter>", { desc = "Quit file" })

-- clipboard things [[
--[[
    There is a delicate setup here.
    This map lets me write to system clipboard (which can be fwd'd over ssh)
    but the terminal (e.g. Kitty) may ask before reading from system clipboard.
    This is a security thing; the client doesn't know what could be in the clipboard.
    But we can manually paste text from the operating system's keymap
]]
-- yank to clipboard
keymap("n", "<Space>y", '"+y', opts)
keymap("v", "<Space>y", '"+y', opts)

-- SPLITS
-- create splits
keymap("n", "<space>sh", "<cmd>split<CR>", opts)
keymap("n", "<space>sv", "<cmd>vsplit<CR>", opts)
-- split navigation
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

-- clear line text without deleting the line
keymap("n", "dc", "0D", { desc = "Delete text from line" })

-- TABS
-- creation
keymap("n", "tr", "<cmd>tabnew<cr><cmd>terminal<cr>", { desc = "New tab with terminal buffer" })
keymap("n", "tn", "<cmd>tabnew<cr>", { desc = "New tab" })
-- navigation
keymap("n", "th", "<cmd>tabprev<cr>", { desc = ":tabprev" })
keymap("n", "tl", "<cmd>tabnext<cr>", { desc = ":tabnext" })

-- chunk selection
-- TODO scope to filetype config
keymap("n", "vic", "/```<cr>NjVnk", opts) -- select chunk contents
keymap("n", "vac", "/```<cr>NVn", opts)   -- select chunk + delimiters


-- :::: VISUAL ::::

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)


-- :::: TERMINAL ::::

-- exit terminal mode to normal
keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
