-- :::: language-specific LSP mods ::::

local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    vim.notify('failed: lsp-zero at client settings')
    return
end

-- :::: LUA ::::

-- hush "undefined global: 'vim'"
lsp.configure('lua_ls', {
    settings = { Lua = {
        diagnostics = {
            globals = { 'vim' }
        }
    }}
})


-- :::: PYTHON ::::

-- pylsp is actually a weird agglomeration of python diagnostics + style pkgs
-- so you have to unwrap the lsp until you find the layer w/ the right pkg 
-- helpful: <https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md>
lsp.configure('pylsp', {
    settings = { pylsp = { plugins = {
        pycodestyle = {
            ignore = {
                'E302',  -- I'm allowed to use 1 blank line between function defs
                -- 'E305',  -- I'm allowed to use 1 blank line between function defs
                'W391',  -- I'm allowed to put a blank line at the EOF
                'E127'   -- indent on line continuation (muting for Python S-expr)
            },
            maxLineLength = 100 -- people so needlessly opinionated about this
        }
    }}}
})

