-----------------------------------------------------
-- ::: VARIABLES / ALIASES :::

local keymap = vim.keymap.set          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options


-----------------------------------------------------
-- ::: NORMAL :::

-- easier write / source
-- keymap("n", "<space>so", "<cmd>source %<cr>", opts)

-- easier cmds
keymap("n", "<space>;", ":", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- select rmd/qmd chunk
keymap("n", "vic", "/```<cr>NjVnk", opts) -- select chunk contents
keymap("n", "vac", "/```<cr>NVn", opts)   -- select chunk + delimiters

-----------------------------------------------------
-- ::: INSERT :::

keymap("i", "<C-,>", "<-", opts)        -- assignment
keymap("i", "<C-.>", "|>", opts)        -- |> pipe
-- keymap("i", "<C-i>", "%in%", opts)        -- |> pipe

-- keymap("i", "<C-i><C-n>", "%in%", opts) -- %in%, TODO unsure about masking C-i



-----------------------------------------------------
-- ::: TERMINAL :::

-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)


-----------------------------------------------------
-- ::: VISUAL :::

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("v", "p", '"_dP', opts)

