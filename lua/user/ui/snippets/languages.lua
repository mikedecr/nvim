-- ::: language-specific keymaps ::: --

local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
    vim.notify("failed: luasnip")
    return
end


local make_snip = luasnip.parser.parse_snippet
local opts = { noremap = true, silent = true }

luasnip.add_snippets(nil, {
    python = {
        -- DRW
        make_snip("cm", "import clue.maps as cm\n$0", opts),
        make_snip("cv", "import clue.views as cv\n$0", opts),
        make_snip("mex", "from clue.m_expr import evaluate$0", opts),
        make_snip("nf", "@NodeFactory\nasync def $1(ctx$2):\n$0", opts),
        make_snip("async", "async def $1($2):\n$0", opts),
        make_snip("mm", "@defmulti", opts),
        make_snip("dm", "@defmethod($1, $2)\n$0", opts),
        make_snip('rew', 'return await evaluate(ctx, $0)', opts),
        make_snip('md', 'users.mdecrescenzo.$0'),
        make_snip('mdm', 'users.mdecrescenzo.maps$0'),
        make_snip('dsl', 'import clue.datasets_loader as dsl')
    },
    pandoc = {
        make_snip('block', '```$1\n$0\n```', opts),
        make_snip('box', '- [ ] $0')
    }
})




