-- :::::::::::::::::::::::::::::
-- :::: VARIABLES / ALIASES ::::
-- :::::::::::::::::::::::::::::

local keymap = vim.keymap.set          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options


-- :::::::::::::::::::::
-- :::: NORMAL MODE ::::
-- :::::::::::::::::::::

-- easier cmds
keymap("n", "<space>;", ":", opts)

-- Better buffer split navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts) -- this conflicts w/ LSP somehow...
keymap("n", "<C-l>", "<C-w>l", opts)

-- select rmd/qmd chunk
-- TODO maybe relocate to a writing / markdown config?
keymap("n", "vic", "/```<cr>NjVnk", opts) -- select chunk contents
keymap("n", "vac", "/```<cr>NVn", opts)   -- select chunk + delimiters


-- :::::::::::::::::::::
-- :::: INSERT MODE ::::
-- :::::::::::::::::::::

keymap("i", "<C-,>", "<-", opts)        -- assignment
keymap("i", "<C-.>", "|>", opts)        -- |> pipe


-- :::::::::::::::::::::::
-- :::: TERMINAL MODE ::::
-- :::::::::::::::::::::::

-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)


-- :::::::::::::::::::::
-- :::: VISUAL MODE ::::
-- :::::::::::::::::::::

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

