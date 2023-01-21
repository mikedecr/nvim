local ok, lsp = pcall(require, 'lsp-zero')
if not ok then vim.notify('failed: lsp-zero'); return; end

lsp.preset('recommended')
lsp.setup()

