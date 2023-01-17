local ok, lsp = pcall(require, 'lsp-zero')
if not ok then
    vim.notify('failed: lsp-zero (client settings)')
    return
end


lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      -- Tell the language server which version of Lua you're using
      -- (most likely LuaJIT in the case of Neovim)
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false } }
  }
})


