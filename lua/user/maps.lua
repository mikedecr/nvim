-----------------------------------------------------
-- ::: VARIABLES / ALIASES :::

local keymap = vim.api.nvim_set_keymap          -- fn to write a map
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

-- telescope
keymap("n", "<space>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
keymap("n", "<space>fo", "<cmd>lua require'telescope.builtin'.oldfiles()<cr>", opts)
keymap("n", "<space>fl", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<space>fg", "<cmd>Telescope git_commits<cr>", opts)

-- tree
keymap("n", "<space>nf", "<cmd>NeoTreeFloatToggle<cr>", opts)
keymap("n", "<space>nb", "<cmd>NeoTreeFocusToggle<cr>", opts)
keymap("n", "<space>ns", "<cmd>NeoTreeRevealInSplitToggle<cr>", opts)

-- select rmd/qmd chunk
keymap("n", "vic", "/```<cr>NjVnk", opts) -- select chunk contents
keymap("n", "vac", "/```<cr>NVn", opts)   -- select chunk + delimiters

-----------------------------------------------------
-- ::: INSERT :::

keymap("i", "<C-,>", "<-", opts)        -- assignment
keymap("i", "<C-.>", "|>", opts)        -- |> pipe
keymap("i", "<C-i>", "%in%", opts)        -- |> pipe

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

