-- local ok, lsp = pcall(require, 'lsp-zero')
-- if not ok then
--     vim.notify('failed: lsp-zero (client settings)')
--     return
-- end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then vim.notify('failed: lspconfig at client settings') return end

