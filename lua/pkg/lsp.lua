vim.pack.add({
    "http://github.com/neovim/nvim-lspconfig",
    "http://github.com/mason-org/mason.nvim",
    "http://github.com/mason-org/mason-lspconfig.nvim"
})

require("mason").setup()

-- NB I think these are eagerly loaded
-- furthermore I think lua_ls is time-consuming to initialize.
-- so for efficiency I am loading other servers first

vim.lsp.enable({
    "pyrefly",
    "lua_ls"
})


-- lua
vim.lsp.config(
    "lua_ls",
    {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }, -- this won't interrupt goToDef, somehow...
                },
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    library = {
                        vim.env.VIMRUNTIME, -- lets me gd to nvim builtins
                        "${3rd}/luv/library",
                        "${3rd}/nvim/library", -- type checking w/ lua stubs only?
                        -- vim.api.nvim_get_runtime_file("", true),
                        -- "${3rd}/nvim/runtime", -- should resolve gbl vim
                    },
                    checkThirdParty = false
                },
                telemetry = {
                    enable = false,
                },
            }
        }
    }
)


-- keymaps
-- this should all be in an autocmd
local opts = {remap = false}
local keymap = vim.keymap.set

keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
keymap("n", "gl", function() vim.diagnostic.open_float() end, opts)
keymap("n", "]d", function() vim.diagnostic.jump({count = 1}) end, opts)
keymap("n", "[d", function() vim.diagnostic.jump({count = -1}) end, opts)
keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
-- keymap("n", "<C-H>", function() vim.lsp.buf.signature_help() end, opts)
-- how to do this at the repo level?
keymap("n", "grr", function() vim.lsp.buf.references() end, opts)
keymap("n", "grn", function() vim.lsp.buf.rename() end, opts)
keymap("n", "gca", function() vim.lsp.buf.code_action() end, opts)
