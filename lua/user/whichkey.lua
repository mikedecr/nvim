local ok, whichkey = pcall(require, 'which-key')
if not ok then
    vim.notify('whichkey issues')
    return
end

whichkey.setup()

