-- bootstrap lazy installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- ::: setup packages :::

local ok, lazy = pcall(require, "lazy")
if not ok then vim.notify("failed: lazy.nvim") return end

lazy.setup({
    "nvim-lua/popup.nvim",    -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim",  -- Useful lua functions used by lots of plugins

    ----------------------
    --    appearance    --
    ----------------------

    -- startup
    { "goolord/alpha-nvim",
        dependencies = {'nvim-tree/nvim-web-devicons'} },

    -- status line / window bounds
    { 'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons', opt = true } },
    -- { "nvim-zh/colorful-winsep.nvim" },

    -- color schemes
    "rakr/vim-two-firewatch",
    "tssm/fairyfloss.vim",
    "EdenEast/nightfox.nvim",
    "echasnovski/mini.base16",
    "junegunn/seoul256.vim",

    -- zen mode
    "folke/zen-mode.nvim",

    ----------------------
    --    navigation    --
    ----------------------

    -- fuzzy finder, buffer jumping, etc.
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    'kwkarlwang/bufjump.nvim',
    -- 'ThePrimeagen/harpoon',
    "ahmedkhalf/project.nvim",
    { 'aymericbeaumet/vim-symlink', dependencies = { 'moll/vim-bbye' } },


    --------------------------------
    --    LSP, completion, ...    --
    --------------------------------
    { 'VonHeikemen/lsp-zero.nvim',
        branch = "v2.x",
        dependencies = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
        }
    },
    -- LSP enhancements
    "milisims/nvim-luaref",
    { "folke/trouble.nvim",
          dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- cmps not in lsp-zero...
    "hrsh7th/cmp-cmdline",
    'kdheepak/cmp-latex-symbols',

    -- -- ::: snippets :::
    -- "L3MON4D3/LuaSnip"          -- snippet engine req'd for completion
    -- -- ::: completion
    -- "hrsh7th/nvim-cmp"          -- this is the completion brain
    -- "hrsh7th/cmp-buffer"        -- sources to complete:
    -- "hrsh7th/cmp-path"
    -- "saadparwaiz1/cmp_luasnip"  -- need a snippet engine to deliver completions
    -- "hrsh7th/cmp-nvim-lsp"
    -- "hrsh7th/cmp-nvim-lua"
    -- -- ::: LSP
    -- "neovim/nvim-lspconfig"           -- enable LSP

    ------------------
    --    syntax    --
    ------------------
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate" },
    { "yioneko/nvim-yati",
        dependencies = { "nvim-treesitter/nvim-treesitter" }}, -- patch indents
    -- stats
    "eigenfoo/stan-vim",
    "JuliaEditorSupport/julia-vim",
    -- writing
    "lukas-reineke/headlines.nvim",
    "vim-pandoc/vim-pandoc", -- some language UI stuff?
    "vim-pandoc/vim-pandoc-syntax", -- syntax only
    -- syntax only, but nvim officially has a "quarto" filetype?
    { 'quarto-dev/quarto-vim',
        ft = 'quarto',
        dependencies = { 'vim-pandoc/vim-pandoc-syntax' }
        -- note: needs additional vim highlighting enabled
        -- for markdown in treesitter.lua
    },

    ---------------------
    --    file tree    --
    ---------------------
    { "nvim-neo-tree/neo-tree.nvim",
          branch = "v2.x",
          dependencies = { 
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons" -- suggested only
        },
    },
    "stevearc/oil.nvim",


    -----------------------
    --    text tricks    --
    -----------------------
    'folke/which-key.nvim',
    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    "numToStr/Comment.nvim",
    -- many of these could be 'mini.nvim' pkgs?
    'echasnovski/mini.surround',
    "windwp/nvim-autopairs",
    "Vonr/align.nvim",
    -- TODO: decide if you need this or a different map for "persistent delete/yank"
    { "AckslD/nvim-neoclip.lua",
          dependencies = { 'nvim-telescope/telescope.nvim' } -- or ibhagwan/fzf-lua
                           -- for persistent history, save to DB:
                           -- {'kkharji/sqlite.lua', module = 'sqlite'},
    },
    -- better built-in terminal vim actions
    'chomosuke/term-edit.nvim',

    ---------------
    --    Git    --
    ---------------
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",

    ----------------
    --    REPL    --
    ----------------
    "Vigemus/iron.nvim"
})


