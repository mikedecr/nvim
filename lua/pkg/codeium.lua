-- some gotchas:
-- as of last try, :Codeium Auth WILL TRY TO OPEN A BROWSER WINDOW
-- so setting this up on a remote host WILL NOT WORK without browser forwarding

-- easily toggle between the correct config functions based on the pkg name

vim.pack.add({
    "https://github.com/Exafunction/windsurf.nvim"
})

local codeium = require('codeium')
codeium.setup({
    enterprise_mode = true,
    api = {
        host = "codeium.drwholdings.com",
        path = "/_route/api_server",
        portal_url = "codeium.drwholdings.com",
    },
    enable_chat = true,
    -- virtual chat setup
    virtual_text = {
        enabled = true,
        map_keys = true,
        key_bindings = {
            accept = "<C-f>",
            clear = "<C-h>"
        },
        filetypes = {
            oil = false,
            TelescopePrompt = false
        }
    }
})
