-- Neovim from Scratch:
-- https://www.youtube.com/watch?v=hY5-Q6NxQgY&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=2

vo = vim.opt

-- menus, modes
vo.showmode = true                         -- we don't need to see things like -- INSERT -- anymore
vo.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vo.pumheight = 10                          -- pop up menu height

-- file behavior
vo.fileencoding = "utf-8"                  -- the encoding written to a file
vo.backup = false                          -- creates a backup file
vo.writebackup = false                     -- if file is being edited by another program (or was written while editing with another program), it is not allowed to be edited
vo.swapfile = false                        -- creates a swapfile

-- search
vo.ignorecase = true                       -- ignore case in search patterns
vo.smartcase = true                        -- smart case
vo.hlsearch = true                         -- highlight all matches on previous search pattern

-- buffers / splits
vo.title = true
vo.splitbelow = true                       -- force all horizontal splits to go below current window
vo.splitright = true                      -- force all vertical splits to go to the right of current window
-- vo.showtabline = 2                      -- always show tabs

-- lines
vo.cursorline = true                       -- highlight the current line
vo.number = true
vo.relativenumber = true

-- gutter
vo.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time
vo.numberwidth = 3                         -- set number column width to 2 {default 4}

-- tabstop
vo.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vo.tabstop = 4                             -- insert n spaces for a tab
vo.expandtab = true                        -- convert tabs to spaces
vo.smarttab = true
vo.smartindent = true                      -- make indenting smarter again
vo.autoindent = true

-- wrap
vo.wrap = false                            -- display lines as one long line
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set backspace=indent,eol,start"

-- scrolling / scanning
vo.scrolloff = 4
vo.sidescrolloff = 8

-- interactivity
vo.mouse = "a"
-- vo.paste = true 			               -- setting paste in config creates problems??
vo.clipboard = "unnamedplus"

-- maps and completions
vo.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vo.updatetime = 300                        -- faster completion (4000ms default)

-- undo
vo.undodir = "$HOME/.undo_dir"
vo.undofile = true

-- colors, fonts
vim.cmd "highlight Comment cterm=italic gui=italic"
vo.termguicolors = true

-- move me
-- vo.shortmess:append "c"

