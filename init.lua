-- ::: init.lua :::
-- this is our replacement for ".vimrc" or "init.vim"

-- It works by explicitly requiring modules.
-- We may write as many assorted config files as we want in lua/*,
-- but they won't be activated unless we require them here or somewhere else.

require "user.plug"          -- plugin manager
require "impatient"
require "user.notify"        -- pass notifications to other modules
require "user.options"       -- basic vimrc stuff
require "user.maps"          -- keymaps

require "user.alpha"         -- startup screen
require "user.lualine"       -- project awareness (e.g. adding to fzf paths)
require "user.winbar"        -- top winbar
require "user.colorscheme"   -- color themes

require "user.snippets"      -- configure and write snippets
require "user.cmp"           -- completion (source registry, keymaps, menu appearances)
require "user.lsp"           -- language servers (this is a dir)

require "user.neotree"       -- sidebar
require "user.telescope"     -- fuzzy finder engine
require "user.treesitter"    -- syntax improvements
require "user.yati"          -- patch indentation for treesitter
require "user.gitsigns"      -- git integration
require "user.project"       -- project awareness (changing w.d. when moving, adding to fzf)

-- require "user.headlines"     -- prettier markdown chunks etc.
require "user.pandoc"
require "user.autopairs"     -- self-explanatory
require "user.surround"      -- sandwich/surround with characters
require "user.comment"       -- comment controls
require "user.bufjump"       -- jump to previous buffer
-- TODO: this is ALMOST good.
require "user.neoclip"       -- yank/macro history

require "user.iron"          -- cross-language REPL

-- missing:
-- [x] packer (plug)
-- [x] popup presumably also packer?
-- [x] plenary
-- ripgrep
-- fd
-- ts-rainbow?
-- nui
-- neovim-move
-- project
-- stan
-- pandoc
-- quarto

