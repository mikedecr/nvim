-- This file depends on Packer (https://github.com/wbthomason/packer.nvim)

-- Older versions of this file had a block for Packer to bootstrap its own installation.
-- This was deleted becuase it feels bad.


-- ::: Autocommands :::

-- Echo a message encouraging you to PackerSync
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plug.lua echo "Consider running PackerSync =)"
        " -- another option is to auto-run PackerSync but this often gets annoying:
        " autocmd BufWritePost plug.lua source <afile> | PackerSync
        " -- a middle-ground would be to do this only if the install table is modified,
        "    but that would be pretty challenging for me to implement
    augroup end
]]

-- attach Packer w/ a protected call.
-- This prevents error on startup.
-- Instead we print a message.
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    vim.notify("require('packer') fails. Check if packer.nvim is installed.")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}


-- ::: Plugins :::

return packer.startup(function(use)

    -- ::: packer & basic lua
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins

    -- ::: appearance / UI
    -- startup
    use { "goolord/alpha-nvim",
          requires = {'kyazdani42/nvim-web-devicons'} }
    -- vim builtin mods
    use { "rcarriga/nvim-notify" }
    use { 'nvim-lualine/lualine.nvim',
          requires = {'kyazdani42/nvim-web-devicons', opt = true } }
    use { "nvim-zh/colorful-winsep.nvim" }
    -- color schemes
    use "rakr/vim-two-firewatch"
    use "tssm/fairyfloss.vim"
    use "EdenEast/nightfox.nvim"
    use "rose-pine/neovim"
    -- zen mode
    use "folke/zen-mode.nvim"

    -- ::: navigation :::
    -- fuzzy finder, buffer jumping, etc.
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-media-files.nvim"
    use 'kwkarlwang/bufjump.nvim'
    use 'ThePrimeagen/harpoon'
    use "ahmedkhalf/project.nvim"


    -- ::: LSP-zero, combination LSP x Mason (installer) x nvim-cmp (completion engine)
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = "v1.x",
        requires = {
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
      }
    -- LSP enhancements
    use "milisims/nvim-luaref"
    --
    -- this isn't in lsp-zero...
    use "hrsh7th/cmp-cmdline"
    use 'kdheepak/cmp-latex-symbols'

    -- -- ::: snippets
    -- use "L3MON4D3/LuaSnip"          -- snippet engine req'd for completion
    --
    -- -- ::: completion
    -- use "hrsh7th/nvim-cmp"          -- this is the completion brain
    -- use "hrsh7th/cmp-buffer"        -- sources to complete:
    -- use "hrsh7th/cmp-path"
    -- use "saadparwaiz1/cmp_luasnip"  -- need a snippet engine to deliver completions
    -- use "hrsh7th/cmp-nvim-lsp"
    -- use "hrsh7th/cmp-nvim-lua"
    --
    -- -- ::: LSP
    -- use "neovim/nvim-lspconfig"           -- enable LSP
    -- use "williamboman/nvim-lsp-installer" -- simple lang server installer. NOTE: unsupported, get mason.nvim

    -- keymap helpers
    use { 'folke/which-key.nvim' }

    -- ::: tree sitter / syntax
    use { "nvim-treesitter/nvim-treesitter",
          run = ":TSUpdate" }
    use { "yioneko/nvim-yati",                           -- patch indentation
          requires = { "nvim-treesitter/nvim-treesitter" }}

    -- ::: sidebar / tree :::
    use { 'kyazdani42/nvim-web-devicons' } -- <-- is this just here bc it's a req for neo-tree?
    use { "nvim-neo-tree/neo-tree.nvim",
          branch = "v2.x",
          requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    }
    use "stevearc/oil.nvim"

    -- text tricks
    use "numToStr/Comment.nvim"
    -- these could be a 'mini.nvim' pkgs?
    use "kylechui/nvim-surround"
    use "windwp/nvim-autopairs"
    use "Vonr/align.nvim"
    -- TODO: decide if you need this or a different map for "persistent delete/yank"
    use { "AckslD/nvim-neoclip.lua",
          requires = { 'nvim-telescope/telescope.nvim' }
                       -- telescope or ibhagwan/fzf-lua
                       -- for persistent history: {'kkharji/sqlite.lua', module = 'sqlite'},
    }
    -- better built-in terminal vim actions
    use { 'chomosuke/term-edit.nvim' }

    -- ::: git
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- ::: stats
    use "hkupty/iron.nvim"            -- REPL
    use "eigenfoo/stan-vim"
    use "JuliaEditorSupport/julia-vim" -- julia

    -- writing
    use "lukas-reineke/headlines.nvim"
    use "vim-pandoc/vim-pandoc" -- some language UI stuff?
    use "vim-pandoc/vim-pandoc-syntax" -- syntax only

    -- additional syntax highlights only, but nvim officially has a "quarto" filetype
    use { 'quarto-dev/quarto-vim',
        ft = 'quarto',
        dependencies = { 'vim-pandoc/vim-pandoc-syntax' },
        -- note: needs additional vim highlighting enabled
        -- for markdown in treesitter.lua
    }

    -- use {
    --     'quarto-dev/quarto-nvim',
    --     requires = {
    --       'jmbuhr/otter.nvim',
    --       'hrsh7th/nvim-cmp',
    --       'neovim/nvim-lspconfig',
    --       'nvim-treesitter/nvim-treesitter'
    --     },
    --     config = function()
    --       require 'quarto'.setup {
    --         lspFeatures = {
    --           enabled = true,
    --           languages = { 'r', 'python', 'julia' },
    --           diagnostics = {
    --             enabled = true,
    --             triggers = { "BufWrite" }
    --           },
    --           completion = {
    --             enabled = true
    --           }
    --         }
    --       }
    --     end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    -- if PACKER_BOOTSTRAP then require("packer").sync() end

    end
)

