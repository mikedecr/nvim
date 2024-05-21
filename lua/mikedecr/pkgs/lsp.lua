local attach = function(_, bufnr)  -- client, bufnr

    -- scopes the keymaps to the currently attached buffer(?)
    local opts = {buffer = bufnr, remap = false}
    local keymap = vim.keymap.set

    keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap("n", "gl", function() vim.diagnostic.open_float() end, opts)
    keymap("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    keymap("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
    -- keymap("n", "<C-H>", function() vim.lsp.buf.signature_help() end, opts)
    -- how to do this at the repo level?
    keymap("n", "grr", function() vim.lsp.buf.references() end, opts)
    keymap("n", "grn", function() vim.lsp.buf.rename() end, opts)
    keymap("n", "gca", function() vim.lsp.buf.code_action() end, opts)

end


return {
    'VonHeikemen/lsp-zero.nvim',
    branch = "v2.x",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        -- Snippets
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    config = function()
        local zero = require("lsp-zero")
        -- //// lang config + presets //// --
        local presets = zero.preset("recommended")
        -- TODO: unsure if this is working!!!
        presets.set_preferences({
            suggest_lsp_servers = true,
        })
        -- gutter sign icons
        presets.set_sign_icons({
            error = "!",
            warn = "?",
            hint = "@",
            info = "i"
        })
        -- presets.set_lsp_keymaps = {preserve_mappings = true}
        -- language overrides
        -- :::: language-specific LSP mods ::::
        local lspconfig = require("lspconfig")
        -- :::: LUA ::::
        -- hush "undefined global: 'vim'" + more
        -- but it's possible to only ignore 'vim' if this becomes problematic
        lspconfig.lua_ls.setup(
            zero.nvim_lua_ls()
        )
        -- :::: PYTHON ::::
        -- pylsp is actually a weird agglomeration of python diagnostics + style pkgs
        -- so you have to unwrap the lsp until you find the layer w/ the right pkg 
        -- helpful: 
        --   <https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pylsp>
        --   <https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md>
        lspconfig.pylsp.setup{
            settings = { pylsp = { plugins = {
                pycodestyle = {
                    ignore = {
                        'E303',  -- I'm allowed to put 2 blank lines where I want them
                        'E127',  -- indent on line continuation (muting for Python S-expr)
                        'E251',  -- spaces around param/args
                        -- 'E402',  -- sometimes we have to import things late
                    },
                    maxLineLength = 120 -- people are so needlessly opinionated about this
                }
            }}}
        }
        -- :::: Markdown ::::
        lspconfig.prosemd_lsp.setup({
            filetypes = {'markdown', 'quarto'}
        })
        -- //// keymaps //// --
        -- helpful reference:
        -- https://github.com/ThePrimeagen/init.lua/blob/249f3b14cc517202c80c6babd0f9ec548351ec71/after/plugin/lsp.lua#L48
        -- check also kickstart.nvim for more LSP commands to map
        presets.on_attach(
            function(_, bufnr)  -- client, bufnr
                -- scopes the keymaps to the currently attached buffer(?)
                local opts = {buffer = bufnr, remap = false}
                local keymap = vim.keymap.set
                keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
                keymap("n", "gl", function() vim.diagnostic.open_float() end, opts)
                keymap("n", "]d", function() vim.diagnostic.goto_next() end, opts)
                keymap("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
                keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
                -- keymap("n", "<C-H>", function() vim.lsp.buf.signature_help() end, opts)
                -- how to do this at the repo level?
                keymap("n", "grr", function() vim.lsp.buf.references() end, opts)
                keymap("n", "grn", function() vim.lsp.buf.rename() end, opts)
                keymap("n", "gca", function() vim.lsp.buf.code_action() end, opts)
            end
        )
        -- //// return ////
        presets.setup()
        -- must be after .setup() for some reason
        vim.diagnostic.config({ virtual_text = true })
    end
}
