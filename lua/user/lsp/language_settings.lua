-- :::: language-specific LSP mods ::::

local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    vim.notify('failed: lsp-zero at client settings')
    return
end

-- hush "undefined global: 'vim'"
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

