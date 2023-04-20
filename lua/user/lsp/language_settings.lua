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
                'E305',  -- I'm allowed to use 1 blank line between function defs
                'W391',  -- I'm allowed to put a blank line at the EOF
                'E402',  -- sometimes we have to import things late
                'E127',  -- indent on line continuation (muting for Python S-expr)
                'E251',  -- spaces around param/args
                'E501'   -- I have my own ruler thank you
            },
            -- maxLineLength = 100 -- people are so needlessly opinionated about this
        },
        flake8 = {
            ignore = {
                -- 'E251',   -- spaces around param/args, I don't know where to put this
            }
        }
    }}}
})


-- :::: Markdown ::::
lsp.configure('prosemd_lsp', {
    filetypes = {'markdown', 'quarto'}
})
