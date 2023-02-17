local ok, lsp = pcall(require, 'lsp-zero')
if not ok then vim.notify('failed: lsp-zero'); return; end

lsp.preset({
    name = 'recommended',
    set_lsp_keymaps = {
        preserve_mappings = false -- temp until you define your own lsp maps
    },
    suggest_lsp_servers = true,
})
lsp.setup()

