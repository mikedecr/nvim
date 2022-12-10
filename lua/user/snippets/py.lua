local snip_ok, ls = pcall(require, "luasnip")
if not snip_ok then
    vim.notify("LuaSnip and Comments can't be used to write comment snippets")
    return
end


local make_snip = ls.parser.parse_snippet

-- `all` probably needs to be a filetype
-- can we manage this with an autocmd in some way?
-- what does `nil` do here?

ls.add_snippets(nil, {
    all = {
        make_snip("nf", "@NodeFactory\n$0"),
        make_snip("async", "async def $1($2):\n$0"),
        make_snip("mm", "@defmulti"),
        make_snip("dm", "@defmethod($1, $2)\n$0"),
        make_snip('block', '```$1\n$0\n```')
    }
})

