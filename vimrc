set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'dracula/vim'
Plugin 'EdenEast/nightfox.nvim'

call vundle#end()            " required
filetype plugin indent on    " required
set t_Co=256
set foldmethod=indent
set foldlevel=99

au BufNewFile, BufRead *.py
	\set tabstop=4
	\set softtabstop=4
	\set shiftwidth=4
	\set textwidth=79
	\set expandtab
	\set autoindent
	\set fileformat=unix

" Highlight searches
set hlsearch
" Seaches incrementaly
set incsearch
" Enable mouse support
set mouse=a
" Color scheme for VIM editor
colorscheme terafox
" Set Status Bar
set laststatus=2
"Enable smartcase search sensitivity
set ignorecase
set smartcase
" Show the matching part of pairs [] {} 
set showmatch
" Automatically wrap text that extends beyond the screen length
set wrap
" Sets default clipboards to the system clipboard
set clipboard=unnamedplus
" Set tab size to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
" Converts our tabs to spaces
set expandtab
set autoindent
set smartindent
" Some basics
set nocompatible
" Syntax highlighting
syntax on
" Sets the line number
set number relativenumber
" Enable autocompletion ctrl + n to activate
set wildmode=longest,list,full
" Disables automatic commenting on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Remap S to search globaly
nnoremap S :%s//g<Left><Left>
" Remap W to save without quitting (Esc + W)
nnoremap W :w!<Left><Left>
" Paste from your system clipboard with ctrl+i instead of shift insert
map <S-Insert> <C-i>
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed
vnoremap <C-c> "+y
map <C-p> "+P 

