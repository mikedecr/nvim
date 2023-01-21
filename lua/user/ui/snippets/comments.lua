local snip_ok, ls = pcall(require, "luasnip")
if not snip_ok then
    vim.notify("LuaSnip and Comments can't be used to write comment snippets")
    return
end

local text = ls.text_node
local snip = ls.snippet
local insert = ls.insert_node
local opts = {}


local dashes = function(n)
    return string.rep('-', n)
end


-- TODO
-- k...kill.. m..mee

ls.add_snippets(nil, {
    all = {
        snip(
            { trig = "comm", namr = "Big comment", dscr = "Big comment" },
            { text({ "# " .. dashes(50) } ),
              text({"", "#  "}), insert(1, "comment"),
              text({"",  "# " .. dashes(50), "" }),
            }
        ),
        ls.parser.parse_snippet("com", "# ----- $1 ----------$0", opts),
    },
})

