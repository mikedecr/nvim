-----------------------------------------------------
-- ::: VARIABLES / ALIASES :::

local keymap = vim.api.nvim_set_keymap          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options


-----------------------------------------------------
-- ::: NORMAL :::

-- easier write / source
keymap("n", "<space>ww", "<cmd>w<cr>", opts)
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
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- tree
keymap("n", "<leader>e", ":NeoTreeFocusToggle<cr>", opts)

-- select rmd/qmd chunk
keymap("n", "vic", "/```<cr>NjVnk", opts) -- select chunk contents
keymap("n", "vik", "/```<cr>NVn", opts)   -- select chunk + delimiters

-----------------------------------------------------
-- ::: INSERT :::

keymap("i", "<C-,>", "<-", opts)        -- assignment
keymap("i", "<C-.>", "|>", opts)        -- |> pipe
keymap("i", "<C-.><C-.>", "%>%", opts)  -- %>% pipe
-- keymap("i", "<C-i><C-n>", "%in%", opts) -- %in%, TODO unsure about masking C-i


-----------------------------------------------------
-- ::: TERMINAL :::

-- Esc exits terminal's Insert mode
keymap("t", "<Esc>", "<C-\\><C-n>", opts)



