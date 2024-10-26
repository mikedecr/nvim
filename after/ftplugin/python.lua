local opts = { noremap = true, silent = true, buffer = 0 }

vim.keymap.set("i", "<C-.>", "->", opts)  -- type hint return
