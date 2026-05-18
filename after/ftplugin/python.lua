-- buffer-local maps
local opts = { noremap = true, silent = true, buffer = true }
vim.keymap.set("i", "<C-.>", "->", opts)  -- type hint return

-- snippets
if vim.g.did_setup_python_snippets then return end
vim.g.did_setup_python_snippets = true

local luasnip = require("luasnip")
local make_snip = luasnip.parser.parse_snippet
local md_snips = require("pkg.luasnip")

local python_snips = {
    make_snip("ia", "import $1 as $0")
}
md_snips.set_language_snippets("python", python_snips)
