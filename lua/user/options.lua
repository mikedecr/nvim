-- Neovim from Scratch:
-- https://www.youtube.com/watch?v=hY5-Q6NxQgY&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=2

-- I don't use editorconfig
-- putting this up top so I can be reminded in case this ever changes
-- might (maybe) prevent issues w/ vim-symlink: <https://github.com/aymericbeaumet/vim-symlink/issues/14>
vim.g.editorconfig = false

-- menus, modes
vim.opt.pumheight = 10       -- pop up menu height (e.g. completion hover dropdown)

-- file behavior
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file

-- NOTE: see :h backup if this becomes frustrating...
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- search
vim.opt.ignorecase = true           -- ignore case in search patterns
vim.opt.smartcase = true            -- smart case
vim.opt.wildignorecase = true       -- ignore case when wildcard-completing files and paths
vim.opt.hlsearch = false            -- highlight all matches on previous search pattern
vim.opt.incsearch = true            -- search while writing pattern string

-- buffers / splits
vim.opt.winbar = "%f %m"                     -- filepath and modified indicator
vim.opt.title = true
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                      -- force all vertical splits to go to the right of current window

-- lines
vim.opt.cursorline = true       -- highlight the current line
vim.opt.number = true
vim.opt.relativenumber = true

-- gutter
vim.opt.signcolumn = "yes"   -- always show the sign column, otherwise it shifts the text each time
vim.opt.numberwidth = 3      -- width of left-side number column {default 4}

-- tabstop
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert n spaces for a tab
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.smarttab = true
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.autoindent = true

-- wrap
vim.opt.colorcolumn = "100"                     -- string for some reason
vim.opt.wrap = false                            -- if false: display lines as one long line
vim.cmd "set whichwrap+=<,>,[,],h,l"            -- actions can traverse lines
vim.cmd "set backspace=indent,eol,start"

-- max diff between cursor and window bounds
-- vim.opt.scrolloff = 6
-- vim.opt.sidescrolloff = 8

-- interactivity
vim.opt.mouse = "a"                    -- clicking is allowed
-- vim.g.clipboard = {                    -- yank to local clipboard from remote nvim over ssh
--     name = 'OSC 52',
--     copy = {
--         ['+'] = require('vim.ui.clipboard.osc52').copy,
--         ['*'] = require('vim.ui.clipboard.osc52').copy,
--     },
--     paste = {
--         ['+'] = require('vim.ui.clipboard.osc52').paste,
--         ['*'] = require('vim.ui.clipboard.osc52').paste,
--     },
-- }

-- maps and completions
vim.opt.timeoutlen = 1000   -- miliseconds to wait for a mapped sequence to complete
vim.opt.updatetime = 300    -- faster completion (4000ms default)
--[[ 
    Disable certain auto-comment behaviors:
    r       Automatically insert the current comment leader after hitting
            -- <Enter> in Insert mode.
    c       Auto-wrap comments using textwidth, inserting the current comment
            leader automatically.
    o       Automatically insert the current comment leader after hitting 'o' or 
            'O' in Normal mode.
]]
vim.cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"


-- undo
vim.opt.undodir = ".undo"
vim.opt.undofile = true

-- colors, fonts
vim.cmd "highlight Comment cterm=italic gui=italic"
vim.opt.termguicolors = true


