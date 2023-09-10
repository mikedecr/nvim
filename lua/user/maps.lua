-- :::::::::::::::::::::::::::::
-- :::: VARIABLES / ALIASES ::::
-- :::::::::::::::::::::::::::::

-- fn to write a map
local keymap = vim.keymap.set

-- table of map options
local opts = { noremap = true, silent = true }


-- :::::::::::::::::::::
-- :::: NORMAL MODE ::::
-- :::::::::::::::::::::

-- easy save
keymap("n", "<Space>w", "<cmd>w<cr>", opts)
keymap("n", "<Space>q", "<cmd>q<cr>", opts)

-- Better buffer split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts) -- this conflicts w/ LSP somehow...
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-p>", "<cmd>bp<cr>", opts)
keymap("n", "<C-n>", "<cmd>bn<cr>", opts)

-- J without moving cursor to EOL
keymap("n", "J", "mzJ`z", opts)

-- normal half-page jumping, but recenter the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Resize window using <ctrl> arrow keys
-- This doesn't work so well on the Mac...

keymap("n", "<C-Up>", "<cmd>resize +2<cr>", {desc = "Increase window height"})
keymap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })


-- select rmd/qmd chunk
-- TODO maybe relocate to a writing / markdown config?
keymap("n", "vic", "/```<cr>NjVnk", opts) -- select chunk contents
keymap("n", "vac", "/```<cr>NVn", opts)   -- select chunk + delimiters

-- quickfix list navigation
vim.keymap.set("n", "<C-Q><C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-Q><C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-Q><C-n>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<C-Q><C-p>", "<cmd>lprev<CR>zz")


-- :::::::::::::::::::::
-- :::: INSERT MODE ::::
-- :::::::::::::::::::::

keymap("i", "<C-,>", "<-", opts)   -- assignment
keymap("i", "<C-.>", "|>", opts)   -- |> pipe


-- :::::::::::::::::::::
-- :::: VISUAL MODE ::::
-- :::::::::::::::::::::

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)


-- :::::::::::::::::::::::
-- :::: TERMINAL MODE ::::
-- :::::::::::::::::::::::

-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)


