vim.pack.add({
    "https://github.com/L3MON4D3/LuaSnip",
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- jump forward/backward in snip token flow
keymap({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap({"i", "s"}, "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


-- cute little library to use in after/ftplugin
-- this may be painful if we need to refactor.
-- the assumption is that "set language snippets" can be our indirection point
local luasnip = require("luasnip")
local M = {
    set_language_snippets = function(language, snippets)
        local table = {}
        table[language] = snippets
        luasnip.add_snippets(nil, table)
    end,
    -- defined here bc .md and .qmd will use these?
    markdown_snips = {
        luasnip.parser.parse_snippet('block', '```$1\n$0\n```', opts),
        luasnip.parser.parse_snippet('box', '- [ ] $0'),
    },
}
return M
