vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter.configs").setup({
    auto_install = false,
    sync_install = false, -- only applies to ensure_installed
    ensure_installed = {
        "bash", "gitignore", "haskell", "json", "julia",
        "latex",  -- needs tree-sitter-cli
        "lua", "luadoc", "markdown", "markdown_inline",
        "python", "r", "toml", "vim", "vimdoc", "yaml"
    },
    indent = {
        enable = true
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
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
