" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
highlight LineNr ctermfg=grey
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" add mous support
" set mouse=a

" YAML config
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Plugins
call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Keep undo history across sessions, by storing in file.
set undodir=/tmp/.vim/backups
set undofile

" edit indentLine
let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceChar='·'
let g:indentLine_leadingSpaceEnabled='1'
