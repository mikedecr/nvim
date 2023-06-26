-- ::: global snippet keymap interface ::: --

local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
    vim.notify("failed: luasnip")
    return
end


local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- jump forward/backward in snip completion menu:
keymap({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap({"i", "s"}, "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)

