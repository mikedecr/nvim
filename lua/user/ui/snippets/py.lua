local snip_ok, ls = pcall(require, "luasnip")
if not snip_ok then vim.notify("failed: luasnip"); return; end

local make_snip = ls.parser.parse_snippet
local opts = {}

-- needs to be in some kind of auGroup per filetype
ls.add_snippets(nil, {
    all = {
        make_snip("nf", "@NodeFactory\n$0", opts),
        make_snip("async", "async def $1($2):\n$0", opts),
        make_snip("mm", "@defmulti", opts),
        make_snip("dm", "@defmethod($1, $2)\n$0", opts),
        make_snip('block', '```$1\n$0\n```', opts),
        make_snip('rew', 'return await evaluate($0)', opts),
    }
})

