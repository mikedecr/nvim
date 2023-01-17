local clip_ok, neoclip = pcall(require, 'neoclip')
if not clip_ok then vim.notify('neoclip fails') return end

neoclip.setup()

local keymap = vim.api.nvim_set_keymap          -- fn to write a map
local opts = {noremap = true, silent = true}    -- table of map options

keymap('n', '<space>np', '<cmd>Telescope neoclip default<cr>', opts)
keymap('i', '<C-h><C-p>', '<cmd>Telescope neoclip default<cr>', opts)


