return {
    "L3MON4D3/LuaSnip",
    config = function()
        local ls = require("luasnip")

        -- snippets
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }
        -- jump forward/backward in snip completion menu:
        keymap({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
        keymap({"i", "s"}, "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

        -- comment snippets
        local text = ls.text_node
        local snip = ls.snippet
        local insert = ls.insert_node
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
                ls.parser.parse_snippet("com", "# ----- $1 ----------$0", {}),
            },
        })
    end
}

