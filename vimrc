" Highlight searches 
set hlsearch
" Seaches incrementaly
set incsearch
" Enable mouse support
set mouse=a
" Color scheme
colorscheme industry
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
" Remap W to save without quitting
nnoremap W :w!<Left><Left>
" Paste from your system clipboard with ctrl+i instead of shift insert
map <S-Insert> <C-i>
" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed
vnoremap <C-c> "+y
map <C-p> "+P 
" Automatically deletes all trailing whitespace on save
autocmd BufWritePre * %s/\s\$//e
