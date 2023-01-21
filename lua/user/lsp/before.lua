-- :::: pre-LSP stuff ::::


-- better lua language server behaviors for nvim configs themselves
-- but must be set up before lspconfig_name
-- more here: https://github.com/folke/neodev.nvim
local neodev_ok, neodev = pcall(require, "neodev")
if not neodev_ok then vim.notify('failed: neodev'); return; end

-- add any options here, or leave empty to use the default settings
neodev.setup()
