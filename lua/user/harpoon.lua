-- ::: test if harpoon can be required, else exit the file :::

local ok, _ = pcall(require, 'harpoon.mark')
if not ok then
    vim.notify('harpoon busted')
    return
end


-- ::: key maps for adding to / viewing harpoon list :::

local keymap = vim.api.nvim_set_keymap          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options

local hui = "require('harpoon.ui')"

keymap('n', '<space>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap('n', '<space>hl', "<cmd>lua " .. hui .. ".toggle_quick_menu()<CR>", opts)
keymap('n', '<space>hn', "<cmd>lua " .. hui .. ".nav_next()<CR>", opts)
keymap('n', '<space>hp', "<cmd>lua " .. hui .. ".nav_prev()<CR>", opts)

