return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local ts = require("nvim-treesitter.configs")
        ts.setup({
            auto_install = true,
            sync_install = false, -- only applies to ensure_installed
            ensure_installed = {
                'bash',
                'gitignore',
                'haskell',
                'json',
                'julia',
                'latex',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'python',
                'r',
                'toml',
                'vim',
                'vimdoc',
                'yaml'
            },
            indent = {
                enable = true,
                disable = { "yaml", "lua", "r" } -- fallback is nvim-yati?
            },
            highlight = {
                -- false disables entire extension
                enable = true,
                additional_vim_regex_highlighting = false
                -- additional_vim_regex_highlighting = {'markdown'}, -- quarto-nvim says this is supposed 
                                                                     -- to help something, but it makes 
                                                                     -- quotes look really bad
                -- disable = { "" },       -- list of language that will be disabled
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                  init_selection = "<CR>",
                  node_incremental = "<CR>",
                  node_decremental = "<BS>",
                  scope_incremental = "<S-CR>",
                },
            }
        })
    end
}
