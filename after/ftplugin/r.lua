local opts = { noremap = true, silent = true, buffer = 0 }

vim.keymap.set("i", "<C-,>", "<-", opts)   -- assignment
vim.keymap.set("i", "<C-.>", "|>", opts)   -- |> pipe
