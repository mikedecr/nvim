-- fn to write a map
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }

keymap("i", "<C-,>", "<-", opts)   -- assignment
keymap("i", "<C-.>", "|>", opts)   -- |> pipe

