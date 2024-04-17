return {
    "L3MON4D3/LuaSnip",
    config = function()
        local keymap = vim.keymap.set
        local opts = { noremap = true, silent = true }
        -- jump forward/backward in snip completion menu:
        keymap({"i", "s"}, "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", opts)
        keymap({"i", "s"}, "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
    end
}

