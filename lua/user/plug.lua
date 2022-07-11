local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plug.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local packer_ok, packer = pcall(require, "packer")
if not packer_ok then return end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- ::: packer
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim"    -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"  -- Useful lua functions used by lots of plugins

  -- ::: general
  use "rcarriga/nvim-notify"
  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- ::: color schemes
  use "tssm/fairyfloss.vim"
  use "shaunsingh/nord.nvim"
  use "sainnhe/everforest"
  use "LunarVim/Colorschemes"
  use "folke/tokyonight.nvim"

  -- ::: snippets
  use "L3MON4D3/LuaSnip"          -- snippet engine req'd for completion

  -- ::: completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"

  -- ::: LSP
  use "neovim/nvim-lspconfig"           -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple lang server installer

  -- ::: fuzzy finder
  use "nvim-telescope/telescope.nvim"   -- core fzf infra
  use "BurntSushi/ripgrep"              -- live grep
  use "sharkdp/fd"                      -- improved file finding

  -- ::: tree sitter / syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  -- ::: sidebar / tree :::
  use 'kyazdani42/nvim-web-devicons'
  -- use 'kyazdani42/nvim-tree.lua'
  use {
    'ms-jpq/chadtree',
    branch = 'chad',
    run = 'python3 -m chadtree deps'
  }

  -- :: project
  use "ahmedkhalf/project.nvim"

  -- ::: git
  use "tpope/vim-fugitive"
  use "lewis6991/gitsigns.nvim"

  -- ::: stats
  use "hkupty/iron.nvim"            -- REPL
  -- use "JuliaEditorSupport/julia-vim" -- julia
  use "eigenfoo/stan-vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end

end)

