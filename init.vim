" -------------------------------------------
" see **HIDDEN SEMESTER OF CS** Vim notes: 
" https://missing.csail.mit.edu/2020/editors/
" -------------------------------------------

" --- GENERAL / INHERENT FUNCTIONALITY ---

" always use Vim features instead of Vi-compatibility mode
" seems this is also set in system .vimrc but better safe than sorry
set nocompatible

" allows unsaved hidden buffers, which is risky but useful.
" set hidden

" undo directory
set undodir=~/.vim/undo_dir
set undofile


" --- APPEARANCE ---

set title

" number of offset lines at buffers top/bottom
set scrolloff=2 

" italic comments
highlight Comment cterm=italic gui=italic


" line number / highlight
set number 
set relativenumber
set cursorline

" set ruler
" set textwidth=90
" set colorcolumn=90
" highlight ColorColumn ctermbg=0 guibg=darkgrey


" --- TABSTOP VS. LEVEL OF INDENDATION ---

" <https://developpaper.com/vim-technique-explain-the-difference-between-tabstop-softtabstop-and-expandtab/>
set tabstop=4
set shiftwidth=4
set softtabstop=2      " how many cols the cursor moves upon tab
set smarttab           " tab deletion and scrolling? 
set expandtab          " tabs as spaces
set autoindent
set smartindent


" --- WRAPPING BEHAVIOR ---
set linebreak
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start


" --- INTERACTIVITY ---
set mouse=a                  " click around
set paste                    " enable system paste
set clipboard+=unnamedplus   " yank to system clipboard


" --- SEARCH ---
set ignorecase   " ignore case in searches 
set smartcase    " UNLESS search contains capitalization


" --- IMPORTS ---

runtime ./plug.vim

" --- Old stuff ---
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" this is for OG vim only 
" source ~/.vimrc

