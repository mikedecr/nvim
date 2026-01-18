-- maps
local opts = { noremap = true, silent = true, buffer = 0 }
vim.keymap.set("i", "<C-.>", "->", opts)  -- type hint return

-- snippets
local luasnip = require("luasnip")
local make_snip = luasnip.parser.parse_snippet
local md_snips = require("pkg.luasnip")

local python_snips = {
    make_snip("ia", "import $1 as $0"),
    make_snip("mnf", "@pc.MergedNodeFactory\nasync def $1($2):\n\t$0"),
    make_snip("nf", "@NodeFactory\nasync def $1($2):\n\t$0"),
    make_snip("giv", "gather_into_view"),
    make_snip("gid", "gather_into_dict"),
    make_snip("icm", "from clue import maps as cm"),
    make_snip("ipc", "from plum import core as pc")
}
md_snips.set_language_snippets("python", python_snips)
