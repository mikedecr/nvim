-- maps
local opts = { noremap = true, silent = true, buffer = true }
vim.keymap.set("i", "<C-]>", "- [ ] ", opts)

-- guard against duplicate snippet definitions
if vim.g.did_setup_markdown_snippets then return end
vim.g.did_setup_markdown_snippets = true

local snips = require("pkg.luasnip")
snips.set_language_snippets("markdown", snips.markdown_snips)
