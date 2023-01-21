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

local ui_snip = "user.ui.snippets."

require(ui_snip .. "comments")
require(ui_snip .. "py") -- <-- scope to filetype!!!

