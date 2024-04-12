local conf = function()
    -- don't let oil have C-p map
    require("oil").setup({
        keymaps = {
            ["C-p"] = false,
            ["<Space>v"] = "actions.preview"
        }
    })
    -- open oil
    vim.keymap.set("n", "<space>od", "<CMD>Oil<CR>", { desc = "Open Oil" })
end

return { 
    "stevearc/oil.nvim",
    config = conf 
}
