local ok, zero = pcall(require, 'lsp-zero')
if not ok then
    vim.notify('failed: lsp-zero')
    return
end


-- //// lang config + presets //// --

zero.preset("recommended")
zero.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = { error = "X",
                   warning = "W",
                   hint = "?",
                   info = "i" }
})

-- language overrides
require("user.lsp.language_settings")


-- //// keymaps //// --
-- helpful reference:
-- https://github.com/ThePrimeagen/init.lua/blob/249f3b14cc517202c80c6babd0f9ec548351ec71/after/plugin/lsp.lua#L48

local keymap = vim.keymap.set
zero.on_attach(
    function(_, bufnr)  -- client, bufnr
        local opts = {buffer = bufnr, remap = false}

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

zero.setup()
-- must be after zero.setup() for some reason
-- vim.diagnostic.config({ virtual_text = true })

