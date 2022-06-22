local ts_ok, configs = pcall(require, "nvim-treesitter.configs")
if not ts_ok then return end

configs.setup {
  ensure_installed = 
        "all",
  -- {  -- one of "all", or a list of languages
        -- "bash",
        -- "bibtex",
        -- "cpp",
        -- "css",
        -- "commonlisp",
        -- "dockerfile",
        -- "dot",
        -- "html",
        -- "java", "javascript",
        -- "json", "json5",
        -- "julia",
        -- "latex",
        -- "lua",
        -- "make",
        -- "markdown",
        -- "python",
        -- "r",
        -- "ruby",
        -- "rust",
        -- "scala",
        -- "scss",
        -- "toml",
        -- "vim",
        -- "yaml"
        -- },
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
}
