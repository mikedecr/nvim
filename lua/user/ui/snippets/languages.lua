-- ::: language-specific keymaps ::: --

local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
    vim.notify("failed: luasnip")
    return
end


local make_snip = luasnip.parser.parse_snippet
local opts = { noremap = true, silent = true }

local markdown_snips = {
    make_snip('block', '```$1\n$0\n```', opts),
    make_snip('py', '```{python}\n$0\n```', opts),
    make_snip('r', '```{r}\n$0\n```', opts),
    make_snip('jl', '```{julia}\n$0\n```', opts),
    make_snip('yp', '```\n\n```{python}\n$0', opts),
    make_snip('box', '- [ ] $0'),
}

luasnip.add_snippets(nil, {
    python = {
        -- DRW
        make_snip("async", "async def $1($2):\n$0", opts),
        make_snip("mm", "@defmulti\n$1def $2($3):\n$0", opts),
        make_snip("dm", "@defmethod($1, $2)\n$3def _$1($4):\n$0", opts),
        make_snip("nf", "@NodeFactory\nasync def $1(ctx$2):\n$0", opts),
        make_snip("mnf", "@MergedNodeFactory\n$0", opts),
        make_snip("giv", "gather_into_view", opts),
        make_snip("gid", "gather_into_dict", opts),
        make_snip("cm", "import clue.maps as cm\n$0", opts),
        make_snip("chl", "import clue.high_level as chl\n$0", opts),
        make_snip('dsl', 'import clue.datasets_loader as dsl'),
        make_snip("cv", "import clue.views as cv\n$0", opts),
        make_snip("mex", "from clue.m_expr import evaluate$0", opts),
        make_snip('rew', 'return await evaluate(ctx, $0)', opts),
        make_snip("vd", "import clue.visidata as vd\n$0", opts),
        make_snip('md', 'users.mdecrescenzo.$0'),
        make_snip('mdm', 'users.mdecrescenzo.maps$0')
    },
    pandoc = markdown_snips,
    quarto = markdown_snips
})




