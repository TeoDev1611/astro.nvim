"---------------------------------VIM CONFIGURATION----------------------------
syntax enable
filetype on
set number
set mouse=a
set relativenumber
set clipboard=unnamedplus
set background=dark
set fileencoding=utf-8
set showcmd
set ruler
set showmatch
set sw=2
let mapleader = " "
set laststatus=2
set backspace=2
set guioptions-=T
set guioptions-=L
set cursorline
"
""Salir de modo insertar
imap jk <Esc>
imap <C-c> <Esc>l
"mueve bloques de codigo en modo visual o V-Line
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv 
"
"" Mejor Indentación
vnoremap < <gv
vnoremap > >gv
"Remaping Splits
nmap <silent> <C-left> :wincmd h<CR>
nmap <silent> <C-right> :wincmd l<CR>
nmap <silent> <C-up> :wincmd k<CR>
nmap <silent> <C-down> :wincmd j<CR>
"------------------------------------------PLUGINS VIM
call plug#begin()
" Temas
 Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
 " Fern
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'
"FERN ICONS
Plug 'ryanoasis/vim-devicons'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" VERSION ESTABLE DE COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Cerrar los pares () [] {} '' 
Plug 'jiangmiao/auto-pairs'
"       "PYTHON
Plug 'hdima/python-syntax'
"       "Git Fugitive
Plug 'tpope/vim-fugitive'
"       "NERD COMMENTER
Plug 'preservim/nerdcommenter' 
Plug 'voldikss/vim-floaterm'
call plug#end()

"--------------------------------------------SHORTCUTS PLUGINS AND VIM

"ENCODING DEV ICONS
set encoding=UTF-8
"guardar archivo
nmap <leader>w :w <CR>
"cerrar ventana
nmap <C-w> :q <CR>
nmap <leader>q :q <CR>
nmap <leader>so :so%<CR>
"comandos de busqueda
nmap <leader>gs  :CocSearch<CR>
nmap <leader>fz  :FZF<CR>

" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB para ir a atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
"cerrar buffer
nmap <leader>bd :bdelete<CR>

"---------------------------------------------THEME CONFIG

if has('termguicolors')
      set termguicolors
endif
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
set background=dark
let g:gruvbox_italicize_strings=1
colorscheme gruvbox
let g:gruvbox_italicize_strings=1

"--------------------------------------------------AIRLINE CONFIG

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'gruvbox'
set showtabline=2
set noshowmode

"------------------------------------------------VIML CONFIG

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"------------------------------------------------COC-PRETTIER

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"------------------------------------------------FERN CONFIG
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

" not-hidden
let g:fern#default_hidden= 1

" exclude
let g:fern#default_exclude='node_modules'

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> t <Plug>(fern-action-trash)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> s <Plug>(fern-action-mark:set)
  nmap <buffer> r <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> R <Plug>(fern-action-reload)
  nmap <buffer> y <Plug>(fern-action-yank)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> u <Plug>(fern-action-leave)
  nmap <buffer><nowait> c <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

" Fixer
let g:cursorhold_updatetime = 100

" Devicoins
let g:fern#renderer = "nerdfont"

" Palette
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

map <Leader>n :Fern . -reveal=%<CR>
noremap <Leader>fn  :Fern . -drawer -reveal=% -toggle -width=30<CR><C-w>=

"FERN GIT
" Disable listing ignored files/directories
let g:fern_git_status#disable_ignored = 1

" Disable listing untracked files
let g:fern_git_status#disable_untracked = 1

" Disable listing status of submodules
let g:fern_git_status#disable_submodules = 1

" Disable listing status of directories
let g:fern_git_status#disable_directories = 1

"-------------------------------------TERMINAL CONFIG-------------------
"nnoremap <C-t> :vs<bar>term<cr><c-w>H<cr>
nmap <leader>ft :FloatermNew<CR>
