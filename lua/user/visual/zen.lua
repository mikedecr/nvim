local ok, zen = pcall(require, 'zen-mode')
if not ok then
    vim.notify('failed: zen-mode')
    return
end


local light_zen = function()
    require('zen-mode').toggle()
    vim.opt.colorcolumn = "0"
end

vim.keymap.set("n", "<space>zz", function() light_zen() end)

