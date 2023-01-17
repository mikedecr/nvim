-- ::: init.lua :::
-- this is our replacement for ".vimrc" or "init.vim"

-- It works by explicitly requiring modules.
-- We may write as many assorted config files as we want in lua/*,
-- but they won't be activated unless we require them here or somewhere else.

require "user.plug"          -- plugin manager
require "user.options"       -- basic vimrc stuff
require "user.maps"          -- keymaps

-- :: thematic setup ::
require "user.visual"
require "user.navigation"

-- text UI
require "user.snippets"      -- configure and write snippets
require "user.cmp"           -- completion (source registry, keymaps, menu appearances)
require "user.autopairs"     -- self-explanatory
require "user.surround"      -- sandwich/surround with characters
require "user.neoclip"       -- yank/macro history
require "user.iron"          -- cross-language REPL
-- require "user.comment"       -- comment controls

-- syntax
require "user.treesitter"    -- syntax improvements
require "user.yati"          -- patch indentation for treesitter
require "user.pandoc"
-- require "user.headlines"     -- prettier markdown chunks etc.

-- lsp
-- require "user.lsp"           -- language servers (this is a dir)


-- TODO: this is ALMOST good.

-- missing:
-- nui
-- stan
-- pandoc
-- quarto

