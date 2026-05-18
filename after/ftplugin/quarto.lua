-- guard against duplicate snippet definitions
if vim.g.did_setup_quarto_snippets then return end
vim.g.did_setup_quarto_snippets = true

-- snips
local luasnip = require("luasnip")
local make_snip = luasnip.parser.parse_snippet
local snips = require("pkg.luasnip")

local quarto_snips = {
    -- language blocks
    make_snip('py', '```{python}\n$0\n```'),
    make_snip('r', '```{r}\n$0\n```'),
    make_snip('jl', '```{julia}\n$0\n```'),
    make_snip('yp', '```\n\n```{python}\n$0'),
    make_snip('md', '```{=markdown}\n$0\n```'),
    -- chunk options
    make_snip('opt', '#| $0'),
    make_snip('label', '#| label: $0'),
    make_snip('echo', '#| echo: $0'),
    make_snip('include', '#| include: $0'),
    make_snip('eval', '#| eval: $0'),
}

-- inject all markdown snips into quarto
local markdown_snips = snips.markdown_snips
for k, v in ipairs(markdown_snips) do
    quarto_snips[k] = v
end

snips.set_language_snippets("quarto", quarto_snips)
