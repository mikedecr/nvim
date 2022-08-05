local snip_ok, ls = pcall(require, "luasnip")
local calc_ok, calc_comment_str = require("Comment.ft").calculate
local utils_ok, utils = require("Comment.utils")

if not (snip_ok and calc_ok and utils_ok) then
    vim.notify("LuaSnip and Comments can't be used to write comment snippets")
    return
end

local text = ls.text_node
local snip = ls.snippet
local insert = ls.insert_node


-- --- Get the comment string {beg,end} table
-- ---@param ctype integer 1 for `line`-comment and 2 for `block`-comment
-- ---@return table comment_strings {begcstring, endcstring}
-- local get_cstring = function(ctype)
--     -- use `Comments.nvim` API to fetch comment str for the region
--     -- (eq. '--%s' or '--[[%s]]' for `lua`)
--     local cstring = calc_comment_str { ctype = ctype, range = utils.get_region() } or vim.bo.commentstring
--     -- as we want only the strings themselves and not strings ready for using `format`
--     -- we want to split the left and right side
--     local left, right = utils.unwrap_cstr(cstring)
--     -- either parts can be nil so we optionally return empty strings
--     -- while creating a two-element table
--     return { left or '', right or '' }
-- end


local dashes = function(n)
    return string.rep('-', n)
end

local newline = function(contents)
    text({"", contents})
end

ls.add_snippets(nil, {
    all = {
        snip(
            { trig = "comm", namr = "Big comment", dscr = "Big comment" },
            { text({ "# " .. dashes(50) } ),
              text({"", "#  "}), insert(1, "comment"),
              text({"",  "# " .. dashes(50), "" }),
            }
        ),
        -- snip(
        --     { trig = "com", namr = "Medium comment", dscr = "Medium comment" },
        --     { text({ "# " .. dashes(5) .. " "} ),
        --       insert(1, "comment"),
        --       text({" " .. dashes(10), "" })
        --     }
        -- ),
        ls.parser.parse_snippet("com", "# ----- $1 ----------$0")
        
        -- snip({ trig = "comment", namr = "new comment", dscr = "new comment" },
        --      { text({get_cstring(1)}) }
        -- )
    },
})



