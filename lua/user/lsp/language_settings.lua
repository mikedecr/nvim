-- :::: language-specific LSP mods ::::

local cfg_ok, lspconfig = pcall(require, 'lspconfig')

if not cfg_ok then
    vim.notify("failed: lspconfig")
    return
end


-- :::: LUA ::::

-- hush "undefined global: 'vim'" + more
-- but it's possible to only ignore 'vim' if this becomes problematic
local zero_ok, zero = pcall(require, 'lsp-zero')
if not zero_ok then
    vim.notify('failed: lsp-zero at client settings')
    return
end
lspconfig.lua_ls.setup(
    zero.nvim_lua_ls()
)


-- :::: PYTHON ::::

-- pylsp is actually a weird agglomeration of python diagnostics + style pkgs
-- so you have to unwrap the lsp until you find the layer w/ the right pkg 
-- helpful: <https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md>
lspconfig.pylsp.setup{
    settings = { pylsp = { plugins = {
        pycodestyle = {
            ignore = {
                'E303',  -- I'm allowed to use 1 blank line between function defs
                'E305',  -- I'm allowed to use 1 blank line between function defs
                'W391',  -- I'm allowed to put a blank line at the EOF
                'E402',  -- sometimes we have to import things late
                'E127',  -- indent on line continuation (muting for Python S-expr)
                'E251',  -- spaces around param/args
                'E501'   -- I have my own ruler thank you
            },
            maxLineLength = 100 -- people are so needlessly opinionated about this
        }
    }}}
}


-- :::: Markdown ::::

lspconfig.prosemd_lsp.setup({
    filetypes = {'markdown', 'quarto'}
})

