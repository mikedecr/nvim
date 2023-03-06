-- :::: language-specific LSP mods ::::

local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    vim.notify('failed: lsp-zero at client settings')
    return
end

lsp.configure(
    -- prevents "unrecognized global: 'vim'"
    'lua_ls', {settings = {Lua = {diagnostics = {globals = "vim"}}}}
)

