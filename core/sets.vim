" Syntax and plugin config
syntax on
filetype plugin indent on
"Sets
set encoding=UTF-8
set showtabline=2
set noshowmode
set nocompatible
set mouse=a
set relativenumber
set clipboard=unnamed
set background=dark
set fileencoding=utf-8
set showcmd
set autowrite
set ruler
set showmatch
set sw=2
set conceallevel=0
set laststatus=2
set backspace=2
set guioptions-=T
set guioptions-=L
set nowritebackup
set hidden
set shortmess+=c
set updatetime=300
" Leader key
let mapleader = " "
imap jk <Esc>
imap <C-c> <Esc>l

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv 
vnoremap < <gv
vnoremap > >gv

nnoremap <silent> <C-left> :wincmd h<CR>
nnoremap <silent> <C-right> :wincmd l<CR>
nnoremap <silent> <C-up> :wincmd k<CR> 
nnoremap <silent> <C-down> :wincmd j<CR>
nnoremap <leader>w :w <CR>
nnoremap <C-w> :q <CR>
nnoremap <leader>q :q <CR>
nnoremap <leader>so :so%<CR>

nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>
