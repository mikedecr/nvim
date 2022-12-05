local ts_ok, configs = pcall(require, "nvim-treesitter.configs")
if not ts_ok then return end

configs.setup {
    ensure_installed = {
        'bash',
        'bibtex',
        'clojure',
        'cmake',
        'cpp',
        'dot',
        'elm',
        'fennel',
        'git_rebase',
        'gitattributes',
        'gitignore',
        'haskell',
        'help',
        'html',
        'http',
        'json',
        'julia',
        'latex',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'r',
        'regex',
        'ruby',
        'scala',
        'scss',
        'sql',
        'todotxt',
        'toml',
        'vim',
        'yaml'
    }, -- one of 'all' or a { list } of languages
    sync_install = false,     -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" },  -- List of parsers to ignore installing
    highlight = {
        enable = true,          -- false will disable the whole extension
        disable = { "" },       -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "yaml", "lua", "python" } -- fallback is nvim-yati?
    },
}

