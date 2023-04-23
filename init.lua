-- :::: init.lua ::::
-- this is our replacement for ".vimrc" or "init.vim"

-- It works by explicitly requiring modules.
-- We may write whatever config files as we want in lua/*,
-- but they won't be activated unless we require them somehow.


-- :::: config layout ::::

-- in the top section we have "base" or "dependency-free" modifications
-- including vim options and keymaps
-- we also specify plugins to be used elsewhere

require "user.options"       -- basic vimrc stuff
require "user.maps"          -- keymaps
require "user.plug"          -- plugin manager

-- remaining configs are sorted by their substantive / functional domain

require "user.lsp"          -- configuring built-in LSP
require "user.visual"       -- appearance + aesthetics
require "user.nav"   -- from file to file
require "user.ui"           -- text-base interfaces, what neovim does when you type
require "user.syntax"       -- how neovim understands + decorates language syntax

