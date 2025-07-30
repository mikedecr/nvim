-- :: TEXT ::

-- tabstop
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- newline indent
vim.opt.autoindent = true
vim.opt.smartindent = true

-- wrapping/nav/backspace line traversal
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd "set backspace=indent,eol,start"
vim.opt.wrap = false

-- disable comment continuation on (r)eturn, (c)ontinue/wrap, (o)
vim.cmd "autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o"

-- undo
vim.opt.undodir = ".undo"
vim.opt.undofile = true

-- buf text search
vim.opt.ignorecase = true           -- ignore by default
vim.opt.smartcase = true            -- except when using a capital
vim.opt.wildignorecase = true       -- and when wildcard-completing files/paths
vim.opt.incsearch = true            -- jump mid-search
vim.opt.hlsearch = false            -- highlight all pattern matches


-- :: VISUAL ::

-- gutter
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- always leave room for signcol

-- buffers + splits
vim.opt.winbar = "%f %m"         -- @ buffer top
vim.opt.title = true             -- @ terminal tab title
vim.opt.splitbelow = true   -- horiz splits below
vim.opt.splitright = true   -- vertical splits right

-- misc/visual
vim.opt.cursorline = false
-- vim.cmd "highlight Comment cterm=italic gui=italic"
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"    -- right-side ruler


-- :: BEHAVIOR ::

vim.g.editorconfig = false

-- mouse ok in "a" modes
vim.opt.mouse = "a"

-- file backups (just don't...)
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- originally controls time to write swapfile,
-- but many other plugins use this for e.g. completion timeout
-- we don't use swapfile so we might as well speed this up (4000ms default!)
vim.opt.updatetime = 300

-- yank to local clipboard from remote nvim over ssh
vim.g.clipboard = "osc52"
