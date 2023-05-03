local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then vim.notify("failed: luasnip"); return; end

-- :::: global snippet behaviors ::::

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- jump forward in snip:
keymap({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- jump backward:
keymap({"i", "s"}, "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


-- :::: Other things ::::

require("user.ui.snippets.comments")


local make_snip = luasnip.parser.parse_snippet

-- TODO: async def x(y) should be a variable :)
luasnip.add_snippets(nil, {
    python = {
        make_snip("nf", "@NodeFactory\nasync def $1(ctx$2):\n$0", opts),
        make_snip("async", "async def $1($2):\n$0", opts),
        make_snip("mm", "@defmulti", opts),
        make_snip("dm", "@defmethod($1, $2)\n$0", opts),
        make_snip('rew', 'return await evaluate($0)', opts),
    },
    pandoc = {
        make_snip('block', '```$1\n$0\n```', opts)
    }
})


