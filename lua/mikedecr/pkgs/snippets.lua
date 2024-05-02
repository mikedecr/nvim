return {
    'L3MON4D3/LuaSnip',
    config = function()

        local luasnip = require("luasnip")

        -- jump forward and backward intra-snippet
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }

        keymap({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
        keymap({"i", "s"}, "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

        -- custom snippets
        local make_snip = luasnip.parser.parse_snippet

        local markdown_snips = {
            make_snip('block', '```$1\n$0\n```', opts),
            make_snip('py', '```{python}\n$0\n```', opts),
            make_snip('r', '```{r}\n$0\n```', opts),
            make_snip('jl', '```{julia}\n$0\n```', opts),
            make_snip('yp', '```\n\n```{python}\n$0', opts),
            make_snip('box', '- [ ] $0'),
        }

        luasnip.add_snippets(
            nil,
            {
                python = {
                    make_snip("ia", "import $1 as $0"),
                },
                pandoc = markdown_snips,
                quarto = markdown_snips
            }
        )

    end
}
