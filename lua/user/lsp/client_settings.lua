-- this is where we would do language-specific LSP mods
-- if we had any
local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then vim.notify('failed: lspconfig at client settings') return end

