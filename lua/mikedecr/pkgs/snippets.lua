return {
    'L3MON4D3/LuaSnip',
    config = function()

        local luasnip = require("luasnip")

        -- next/prev position in snippet
        local opts = { noremap = true, silent = true }
        vim.keymap.set({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
        vim.keymap.set({"i", "s"}, "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

        -- custom snippets
        local make_snip = luasnip.parser.parse_snippet

        local markdown_snips = {
            make_snip('block', '```$1\n$0\n```', opts),
            make_snip('box', '- [ ] $0'),
        }

        local quarto_snips = {
            -- language blocks
            make_snip('py', '```{python}\n$0\n```', opts),
            make_snip('r', '```{r}\n$0\n```', opts),
            make_snip('jl', '```{julia}\n$0\n```', opts),
            make_snip('yp', '```\n\n```{python}\n$0', opts),
            make_snip('md', '```{=markdown}\n$0\n```', opts),
            -- chunk options
            make_snip('opt', '#| $0'),
            make_snip('label', '#| label: $0'),
            make_snip('echo', '#| echo: $0'),
            make_snip('include', '#| include: $0'),
            make_snip('eval', '#| eval: $0'),
        }
        -- inject all markdown snips into quarto
        for k, v in ipairs(markdown_snips) do
            quarto_snips[k] = v
        end

        local python_snips = {
            make_snip("ia", "import $1 as $0"),
        }

        luasnip.add_snippets(
            nil,
            {
                python = python_snips,
                pandoc = markdown_snips,
                markdown = markdown_snips,
                quarto = quarto_snips
            }
        )

    end
}
