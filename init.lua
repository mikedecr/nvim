-- ::: init.lua :::
-- this is our replacement for ".vimrc" or "init.vim"

-- It works by explicitly requiring modules.
-- We may write as many assorted config files as we want in lua/*,
-- but they won't be activated unless we require them here or somewhere else.

require "user.options"       -- basic vimrc stuff
require "user.plug"          -- plugin manager
require "user.alpha"         -- startup screen
require "user.notify"        -- pass notifications to other modules
require "user.maps"          -- keymaps
require "user.cmp"           -- completion (source registry, keymaps, menu appearances)
require "user.surround"      -- sandwich/surround with characters
require "user.colorscheme"   -- color themes
require "user.lsp"           -- language servers (this is a dir)
require "user.telescope"     -- fuzzy finder engine
require "user.treesitter"    -- syntax improvements
require "user.neotree"       -- sidebar
require "user.gitsigns"      -- git integration
require "user.project"       -- project awareness (e.g. adding to fzf paths)
require "user.snippets"      -- configure and write snippets
require "user.lualine"       -- project awareness (e.g. adding to fzf paths)
require "user.winbar"        -- top winbar
require "user.comment"       -- comment controls
require "user.bufjump"       -- jump to previous buffer
require "user.iron"          -- cross-language REPL

-- missing:
-- packer
-- popup
-- plenary
-- Luasnip
-- ripgrep
-- fd
-- ts-rainbow?
-- nvim-web-devicons
-- nui
-- neovim-move
-- project
-- stan
-- pandoc
-- quartorequire("notify")require("notify")

