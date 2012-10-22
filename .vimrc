""" indent
filetype plugin indent on
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

""" Vandle
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" Bundle repos:
Bundle 'sjl/gundo.vim'

filetype plugin indent on
