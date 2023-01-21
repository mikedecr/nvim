local success, configs = pcall(require, "nvim-treesitter.configs")
if not success then 
    vim.notify('failed: treesitter')
    return
end

local langs = {
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
}

configs.setup {
    -- one of 'all' or a { list } of languages
    ensure_installed = langs,
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

