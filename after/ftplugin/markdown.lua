-- maps
vim.keymap.set("i", "<C-]>", "- [ ] ")

local snips = require("md.luasnip")
snips.set_language_snippets("markdown", snips.markdown_snips)
