local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    vim.notify('lsp-zero having issues')
    return
end

lsp.preset('recommended')
lsp.setup()

