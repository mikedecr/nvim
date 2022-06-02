" -------------------------------------------
" see **HIDDEN SEMESTER OF CS** Vim notes: 
" https://missing.csail.mit.edu/2020/editors/
" -------------------------------------------

" --- general / inherent functionality ---
" always use Vim features instead of Vi-compatibility mode
" seems this is also set in system .vimrc but better safe than sorry
set nocompatible

" allows unsaved hidden buffers, which is risky but useful.
" set hidden

" undo directory
set undodir=~/.vim/undo_dir
set undofile


" --- lines ---
set number 
set relativenumber
set cursorline

" --- tabstop vs. level of indendation ---
" <https://developpaper.com/vim-technique-explain-the-difference-between-tabstop-softtabstop-and-expandtab/>
set tabstop=4
set shiftwidth=4
set softtabstop=2      " how many cols the cursor moves upon tab
set smarttab           " tab deletion and scrolling? 
set expandtab          " tabs as spaces
set autoindent
set smartindent

" --- wrapping behavior ---
set linebreak
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start

" set ruler
" set textwidth=90
" set colorcolumn=90
" highlight ColorColumn ctermbg=0 guibg=darkgrey

" ------------------------------------------------------------
"   appearance
" ------------------------------------------------------------

" number of offset lines at buffers top/bottom
set scrolloff=2   

" italic comments
highlight Comment cterm=italic gui=italic


" --- INTERACTIVITY ---
set mouse=a                  " click around
set paste                    " enable system paste
set clipboard+=unnamedplus   " yank to system clipboard


" --- search ---
set ignorecase   " ignore case in searches 
set smartcase    " UNLESS search contains capitalization

" yank to system clipboard
set clipboard+=unnamedplus


" plugins
runtime ./plug.vim

" --- Old stuff ---
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" this is for OG vim only 
" source ~/.vimrc

