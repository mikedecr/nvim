local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git", "clone",
        "--depth", "1",
        "https://github.com/wbthomason/packer.nvim", install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end


-- -- Autocommand that reloads this file & PackerSyncs whenever it is written
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plug.lua source <afile> | PackerSync
    augroup end
]]


-- Use a protected call so we don't error out on first use

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    vim.notify('packer fails')
    return
end


-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function() return require("packer.util").float { border = "rounded" } end,
    },
}


-- Install your plugins here
return packer.startup(function(use)

    -- ::: packer & basic lua
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins
    use "lewis6991/impatient.nvim"

    -- ::: appearance
    use "rcarriga/nvim-notify"
    use { 'nvim-lualine/lualine.nvim',
          requires = {'kyazdani42/nvim-web-devicons', opt = true } }
    -- startup
    use { "goolord/alpha-nvim",
          requires = 'kyazdani42/nvim-web-devicons' }
    -- enhance certain syntaxes
    use "lukas-reineke/headlines.nvim"

    -- color schemes
    use 'rockerBOO/boo-colorscheme-nvim'
    use { 'shaunsingh/oxocarbon.nvim',
          run = './install.sh' }
    use "rakr/vim-two-firewatch"
    use "tssm/fairyfloss.vim"
    use "shaunsingh/nord.nvim"
    use 'andersevenrud/nordic.nvim'
    use "LunarVim/Colorschemes"
    use "folke/tokyonight.nvim"
    use "kvrohit/mellow.nvim"
    use "EdenEast/nightfox.nvim"

    -- ::: snippets
    use "L3MON4D3/LuaSnip"          -- snippet engine req'd for completion

    -- ::: completion
    use "hrsh7th/nvim-cmp"          -- this is the completion brain
    use "saadparwaiz1/cmp_luasnip"  -- need a snippet engine to deliver completions
    use "hrsh7th/cmp-buffer"        -- sources to complete:
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lua"

    -- ::: LSP
    use "neovim/nvim-lspconfig"           -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple lang server installer. NOTE: unsupported, get mason.nvim

    -- ::: fuzzy finder
    use "nvim-telescope/telescope.nvim"   -- core fzf infra
    use "BurntSushi/ripgrep"              -- live grep
    use "sharkdp/fd"                      -- improved file finding

    -- ::: tree sitter / syntax
    use { "nvim-treesitter/nvim-treesitter",
          run = ":TSUpdate" }
    use "p00f/nvim-ts-rainbow"
    use { "yioneko/nvim-yati",                           -- patch indentation
          requires = "nvim-treesitter/nvim-treesitter" }

    -- ::: sidebar / tree :::
    use 'kyazdani42/nvim-web-devicons' -- <-- is this just here bc it's a req for neo-tree?
    use { "nvim-neo-tree/neo-tree.nvim",
          branch = "v2.x",
          requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" } }

    -- text tricks
    use "numToStr/Comment.nvim"
    use "ur4ltz/surround.nvim"
    use "windwp/nvim-autopairs"
    use "Vonr/align.nvim"
    -- TODO: decide if you need this or a different map for "persistent delete/yank"
    use { "AckslD/nvim-neoclip.lua",
          requires = { 'nvim-telescope/telescope.nvim' }
                       -- telescope or ibhagwan/fzf-lua
                       -- for persistent history: {'kkharji/sqlite.lua', module = 'sqlite'},
    }

    -- buffer stuff
    use 'kwkarlwang/bufjump.nvim' -- jump bufs fwd and bckwd

    -- file operations
    use 'kovetskiy/neovim-move'

    -- :: project
    use "ahmedkhalf/project.nvim"

    -- ::: git
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- ::: stats
    use "hkupty/iron.nvim"            -- REPL
    use "eigenfoo/stan-vim"
    -- use "JuliaEditorSupport/julia-vim" -- julia

    -- writing
    -- use "vim-pandoc/vim-pandoc" -- this is more about functionality and enhancements
    use "vim-pandoc/vim-pandoc-syntax" -- syntax only
    use "quarto-dev/quarto-vim" -- this is supposedly also syntax only? I'm not sure what the effect is.

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then require("packer").sync() end

end)

