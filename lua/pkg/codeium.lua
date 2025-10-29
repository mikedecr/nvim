-- some gotchas:
-- as of last try, :Codeium Auth WILL TRY TO OPEN A BROWSER WINDOW
-- so setting this up on a remote host WILL NOT WORK without browser forwarding

-- easily toggle between the correct config functions based on the pkg name

local which_pkg = "vim"

vim.pack.add({
    "https://github.com/Exafunction/windsurf." .. which_pkg
})

local cmd_bindings = {
    accept = "<C-f>",
    clear = "<C-h>",
}
local binding_opts = { expr = true, silent = true}

-- no vim-specific?
if which_pkg == "nvim" then
    local codeium = require('codeium')
    codeium.setup({
        -- we don't have enterprice-specific config anymore?
        -- enterprise_mode = true,
        -- api = {
        --     host = "codeium.drwholdings.com",
        --     path = "/_route/api_server",
        --     portal_url = "codeium.drwholdings.com",
        -- },
        enable_chat = true,
        virtual_text = {
            enabled = true,
            map_keys = true,
            key_bindings = cmd_bindings,
            filetypes = {
                oil = false,
                TelescopePrompt = false
            }
        }
    })
end
if which_pkg == "vim" then
    vim.keymap.set('i', cmd_bindings["accept"], function() return vim.fn['codeium#Accept']() end, binding_opts)
    vim.keymap.set('i', cmd_bindings["clear"],  function() return vim.fn['codeium#Clear']() end,  binding_opts)
end
