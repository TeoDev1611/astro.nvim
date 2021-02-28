"---------------------------------VIM CONFIGURATION----------------------------
syntax enable
filetype on
set nocompatible
set number
set mouse=a
set relativenumber
set clipboard=unnamed
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
Plug 'ghifarit53/tokyonight-vim'
Plug 'ayu-theme/ayu-vim' 
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
"Vim rainbow
Plug 'luochen1990/rainbow'
 " Fern
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'
"ICONS
Plug 'ryanoasis/vim-devicons'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" VERSION ESTABLE DE COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"      SYTAXIS EXTRA
Plug 'sheerun/vim-polyglot'
"       "PYTHON
Plug 'hdima/python-syntax'
"       "NERD COMMENTER
Plug 'preservim/nerdcommenter' 
"Float Term
Plug 'voldikss/vim-floaterm'
"Discord Vim Presence
Plug 'Stoozy/vimcord'
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

" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB para ir a atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
"cerrar buffer
nmap <leader>bd :bdelete<CR>

"Install Command
nmap <leader>pi :PlugInstall<CR>
"---------------------------------------------THEME CONFIG

if has('termguicolors')
      set termguicolors
endi"f
"---------------------GRUVBOX" 

"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_italic=1
"set background=dark
"let g:gruvbox_italicize_strings=1
"colorscheme gruvbox
"let g:gruvbox_italicize_strings=1

"---------------------TOKYONIGHT

set termguicolors

"let g:tokyonight_style = 'night' " available: night, storm
"let g:tokyonight_enable_italic = 0
let ayucolor="dark"
colorscheme ayu 

"--------------------------------------------------AIRLINE CONFIG

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'ayu'
set showtabline=2
set noshowmode

"------------------------------------------------VIML CONFIG

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"------------------------------------------------COC-PRETTIER

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"------------------------------------------------------COC-EXPLORER-----------------------------------------------------------------------

let g:coc_global_extensions = [
 \ "coc-explorer",
 \ "coc-prettier"
 \]
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '%USERPROFILE%/coc-settings.json',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }


" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

function! AuCocNvimInit()
    if @% == '' || @% == '.'
      exe ':CocCommand explorer'
    endif
endfunction

augroup MyCocExplorer
  autocmd!
  " set window status line
  autocmd FileType coc-explorer setl statusline=File-Explorer
  "quit explorer whein it's the last
  autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
  " Make sure nothing opened in coc-explorer buffer
  autocmd BufEnter * if bufname('#') =~# "\[coc-explorer\]-." && winnr('$') > 1 | b# | endif
  "open if directory specified or if buffer empty
  autocmd User CocNvimInit call AuCocNvimInit()
  " cd after open
  autocmd User CocExplorerOpenPost let dir = getcwd() | call CocActionAsync("runCommand", "explorer.doAction", "closest", {"name": "cd", "args": [dir]})
augroup END

nnoremap <leader>n :CocCommand explorer<CR>

"Floaterm
nnoremap <leader>t :FloatermNew <CR>

