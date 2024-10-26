local opts = { noremap = true, silent = true, buffer = 0 }

vim.keymap.set("i", "<C-.>", "|>", opts)  -- native pipe
vim.keymap.set("i", "<C-,>", "∘", opts)   -- fn composition
vim.keymap.set("i", "<C-->", "->", opts)  -- lambda infix
vim.keymap.set("i", "<C-=>", "=>", opts)  -- pair infix
vim.keymap.set("i", "<C-;>", "<:", opts)  -- lhs is subtype of rhs
