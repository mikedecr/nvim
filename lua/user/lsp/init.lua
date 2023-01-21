-- :::: Neovim Built-in LSP configuration ::::

local lsp = 'user.lsp.'

require(lsp .. "before")            -- better lua support in nvim config
require(lsp .. "lsp_zero")          -- easy LSP install/hookup
require(lsp .. "client_settings")   -- server-specific

