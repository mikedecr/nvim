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
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local ms = require("mason").setup()
        local mc = require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pylsp"
            },
            handlers = {
                function (server_name)
                    require("lspconfig")[server_name].setup({
                        on_attach = attach
                    })
                end
            }
        })
--        lsp = require("lspconfig").setup({})
        -- lsp.on_attach = attach
    end
}

