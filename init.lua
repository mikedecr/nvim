-- ::: init.lua :::
-- this is our replacement for ".vimrc" or "init.vim"

-- It works by explicitly requiring modules.
-- We may write as many assorted config files as we want in lua/*,
-- but they won't be activated unless we require them here or somewhere else.

require "user.plug"          -- plugin manager
require "user.options"       -- basic vimrc stuff
require "user.maps"          -- keymaps

-- :: thematic setup ::
require "user.lsp"
require "user.visual"
require "user.navigation"
require "user.ui" -- for "text interface" only, what neovim does to you when you type
require "user.syntax"

-- lsp
-- require "user.lsp"           -- language servers (this is a dir)

