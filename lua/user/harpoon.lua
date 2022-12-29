-- ::: test if harpoon can be required, else exit the file :::

local ok, _ = pcall(require, 'harpoon.mark')
if not ok then
    vim.notify('failed: harpoon')
    return
end


-- ::: key maps for adding to / viewing harpoon list :::

local keymap = vim.api.nvim_set_keymap          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options


-- ::: variables for composing cmd strings into keymap args :::

local lua_cmd = "<cmd>lua "
local harpoon_ui_cmd = lua_cmd .. "require('harpoon.ui')"
local ack_file = lua_cmd .. "vim.notify('file added to harpoon jump list')<CR>"

-- pin a file to harpoon list
keymap('n', '<space>ha', lua_cmd .. "require('harpoon.mark').add_file()<CR>" .. ack_file, opts)

-- toggle harpoon popup
keymap('n', '<space>hl', harpoon_ui_cmd .. ".toggle_quick_menu()<CR>", opts)

-- prev/next pinned files
keymap('n', '<space>hn', harpoon_ui_cmd .. ".nav_next()<CR>", opts)
keymap('n', '<space>hp', harpoon_ui_cmd .. ".nav_prev()<CR>", opts)

