local ok, whichkey = pcall(require, 'which-key')
if not ok then
    vim.notify('failed: whichkey')
    return
end

whichkey.setup()

