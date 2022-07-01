-- ::: init.lua :::
-- this is our replacement for ".vimrc" or "init.vim"

-- It works by explicitly requiring modules.
-- We may write as many assorted config files as we want in lua/*,
-- but they won't be activated unless we require them here or somewhere else.

require "user.options"       -- basic vimrc stuff
require "user.plug"          -- plugin manager
require "user.maps"          -- keymaps
require "user.cmp"           -- completion (source registry, keymaps, menu appearances)
require "user.colorscheme"   -- color themes
require "user.lsp"           -- language servers (this is a dir)
require "user.telescope"     -- fuzzy finder engine
require "user.treesitter"    -- syntax improvements
require "user.nvim-tree"     -- sidebar
-- require "user.gitsigns"      -- git integration
require "user.project"       -- project awareness (e.g. adding to fzf paths)
require "user.snippets"      -- configure and write snippets

