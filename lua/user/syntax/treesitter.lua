local success, configs = pcall(require, "nvim-treesitter.configs")
if not success then
    vim.notify('failed: treesitter')
    return
end

local langs = {
    'bash',
    'dot',
    'elm',
    'fennel',
    'gitignore',
    'haskell',
    'json',
    'julia',
    'latex',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'r',
    'toml',
    'vim',
    'yaml'
}

configs.setup {
    -- one of 'all' or a { list } of languages
    ensure_installed = langs,
    sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" },  -- List of parsers to ignore installing
    highlight = {
        enable = true,          -- false will disable the whole extension
        -- disable = { "" },       -- list of language that will be disabled
        additional_vim_regex_highlighting = {'markdown'},  -- <- supports quarto
    },
    indent = {
        enable = true,
        disable = { "yaml", "lua", "python", "r" } -- fallback is nvim-yati?
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
}

