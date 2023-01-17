-- :::::::::::::::::
-- :::: harpoon ::::
-- :::::::::::::::::

-- save a shortlist of goto files

local ok, _harp_mark = pcall(require, 'harpoon.mark')
if not ok then vim.notify('failed: harpoon.mark'); return; end

-- variables for composing cmd strings into keymap args
local keymap = vim.keymap.set
local lua_cmd = "<cmd>lua "
local ui_cmd = lua_cmd .. "require('harpoon.ui')"
local ack_file = lua_cmd .. "vim.notify('file added to harpoon jump list')<CR>"

-- pin a file to harpoon list
keymap('n', '<space>ha', lua_cmd .. "require('harpoon.mark').add_file()<CR>" .. ack_file)
-- toggle harpoon popup
keymap('n', '<space>hl', ui_cmd .. ".toggle_quick_menu()<CR>")
-- prev/next pinned files
keymap('n', '<space>hn', ui_cmd .. ".nav_next()<CR>")
keymap('n', '<space>hp', ui_cmd .. ".nav_prev()<CR>")

