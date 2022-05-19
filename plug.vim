call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" handle all R / syntax / REPL through these.
" no need for pkgs that provide pandoc commands; use quarto-cli or R console 
Plug 'jalvesaq/Nvim-R', {'branch': 'master'}
Plug 'jalvesaq/R-Vim-runtime'

call plug#end()

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-r-lsp', 'coc-python']

