-- TODO fix lsp for vim globals
local vo = vim.opt


---- TEXT ----

-- tabstop
vo.shiftwidth = 4
vo.tabstop = 4
vo.expandtab = true

-- newline indent
vo.autoindent = true
vo.smartindent = true

-- nav/backspace line traversal
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set backspace=indent,eol,start"

-- don't insert comments on r=return, c=continue/wrap, o=`o`
vim.cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"

-- undo
vo.undodir = ".undo"
vo.undofile = true

-- search
vo.ignorecase = true           -- ignore by default
vo.smartcase = true            -- except when using a capital
vo.wildignorecase = true       -- and when wildcard-completing files/paths
vo.incsearch = true            -- jump mid-search
vo.hlsearch = false            -- highlight all pattern matches


---- VISUAL ----

-- gutter
vo.number = true
vo.relativenumber = true
vo.signcolumn = "yes" -- always leave room for signcol

-- buffers + splits
vo.winbar = "%f %m"         -- @ buffer top
vo.title = true             -- @ terminal tab title
vim.opt.splitbelow = true   -- horiz splits below
vim.opt.splitright = true   -- vertical splits right

-- misc/visual
vo.cursorline = true
vo.termguicolors = true   -- authentic colors, thicker cursorline
vo.colorcolumn = "100"    -- right-side ruler


---- BEHAVIOR ----

-- mouse ok in "a" modes
vo.mouse = "a"

-- file backups (just don't...)
vo.backup = false
vo.writebackup = false
vo.swapfile = false

-- originally controls time to write swapfile,
-- but many other plugins use this for e.g. completion timeout
-- we don't use swapfile so we might as well speed this up (4000ms default!)
vo.updatetime = 300

