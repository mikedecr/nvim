local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then vim.notify("failed: luasnip"); return; end

-- :::: Other things ::::

require("user.ui.snippets.keymaps")
require("user.ui.snippets.languages")
require("user.ui.snippets.comments")


