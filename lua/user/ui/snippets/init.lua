local snip_ok, ls = pcall(require, "luasnip")
if not snip_ok then return end

-- -- some shorthands...
-- local snip = ls.snippet
-- local node = ls.snippet_node
-- local text = ls.text_node
-- local insert = ls.insert_node
-- local func = ls.function_node
-- local choice = ls.choice_node
-- local dynamicn = ls.dynamic_node

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


-- jump forward in snip:
keymap({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
-- jump backward:
-- keymap({"i", "s"}, "<S-c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)


-- TODO loop filetype-specific files

require("user.ui.snippets.comments")
require('user.ui.snippets.py') -- <-- scope to filetype!!!
-- require("users.snippets.r")

