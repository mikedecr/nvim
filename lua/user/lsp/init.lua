local lsp_ok, _ = pcall(require, "lspconfig")
if not lsp_ok then 
    vim.notify("require 'lspconfig' fails")
    return
end

require("user.lsp.installer")
require("user.lsp.handlers").setup()

