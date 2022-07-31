local snip_ok, ls = pcall(require, "luasnip")
if not snip_ok then return end

-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- jump forward/backward in snippet
keymap({"i", "s"}, "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
keymap({"i", "s"}, "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("n", "<leader><leader>s", "<cmd>source $HOME/.config/nvim/lua/user/snippets/init.lua<CR>", opts)

-- TODO loop filetype-specific files

require("user.snippets.comments")
-- require("users.snippets.r")

