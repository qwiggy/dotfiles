""" indent
filetype plugin indent on
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

""" color
colorscheme desert

""" Vandle
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundle repos:
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'thinca/vim-quickrun'

filetype plugin indent on
