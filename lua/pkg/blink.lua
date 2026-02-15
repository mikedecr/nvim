vim.pack.add({
    { src="https://github.com/Saghen/blink.cmp", version=vim.version.range("1.*") },
    -- compatibility w/ cmp completion sources
    -- blink.compat==2.* for blink 1.*
    { src="https://github.com/saghen/blink.compat", version=vim.version.range("2.*") },
    -- some pkgs only augment lsp sources via cmp
    'https://github.com/hrsh7th/nvim-cmp',
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    -- we need other sources to be available when this file is executed
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/supermaven-inc/supermaven-nvim",
    "https://github.com/huijiro/blink-cmp-supermaven",
})

local blink = require("blink.cmp")
blink.setup({
    sources = {
        default = {
            "lsp",
            "snippets",
            "buffer",
            "path",
            "supermaven",
        },
        providers = {
            supermaven = {
                module = "blink-cmp-supermaven"
            }
        },
        cmp_nvim_lsp = { module = "cmp-nvim-lsp" }, -- delivers otter via "lsp" default source
    },
    keymap = {
        preset = "none",
        ["<C-space>"] = { "show" },
        ["<C-e>"] = { "show" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-l>"] = { "accept", "snippet_forward" },
        ["<C-h>"] = { "show_signature", "snippet_backward" },
        ["<C-d>"] = { "show_documentation" },
        ["<C-x>"] = { "hide_documentation" },
        ["<C-n>"] = { "scroll_documentation_down" },
        ["<C-b>"] = { "scroll_documentation_up" },
    },
    completion = {
        list = {
            selection = {
                preselect = false  -- do not auto-select the first item
            }
        },
        menu = {
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label", "label_description" },
                    { "source_name" },
                },
                -- kind text/icon could go here
                -- see <https://cmp.saghen.dev/recipes.html#completion-menu-drawing>
                -- components = { kind = {}, kind_icon = {} }
            }
        }
    },
    snippets = { preset = "luasnip" },
})
