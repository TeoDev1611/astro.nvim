"---------------------------------VIM CONFIGURATION----------------------------
syntax on
set nocompatible
set number
set mouse=a
set number
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
Plug 'tekannor/ayu-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'dikiaap/minimalist'
"Indent Line
Plug 'Yggdroot/indentLine'
"ICONS
Plug 'ryanoasis/vim-devicons'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"VERSION ESTABLE DE COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"      SYTAXIS EXTRA
Plug 'sheerun/vim-polyglot'
"       "NERD COMMENTER
Plug 'preservim/nerdcommenter' 
"TREE EXPLORER
"NERD TREE
Plug 'preservim/nerdtree'|
       \ Plug 'Xuyuanp/nerdtree-git-plugin' |
"RUST
Plug 'rust-lang/rust.vim'
"VIM VUE
Plug 'posva/vim-vue'
"VIM PAIRS
Plug 'jiangmiao/auto-pairs'
"JAVASCRIPT AND TYPESCRIPT
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"CTRL P
Plug 'ctrlpvim/ctrlp.vim'
"VIM GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" VIM RUST
Plug 'rust-lang/rust.vim'
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

"Install Command
nmap <leader>pi :PlugInstall<CR>
"Uninstall Command
nmap <leader>pc :PlugClean<CR>

"BUFFERS
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
nmap <leader>bd :bdelete<CR>

"---------------------------------------------THEME CONFIG
if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
endif
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
set background=dark
let g:gruvbox_italicize_strings=1
colorscheme gruvbox
let g:gruvbox_italicize_strings=1
"-------------------------------------------------AIRLINE CONFIG

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

"------------------------------------------------NERD TREE

"MINIMAL UI
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'M',
                \ 'Staged'    :'S',
                \ 'Untracked' :'U',
                \ 'Renamed'   :'R',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'D',
                \ 'Dirty'     :'DD',
                \ 'Ignored'    :'I',
                \ 'Clean'     :'C',
                \ 'Unknown'   :'?',
                \}
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0"
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0"
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <Leader>n :NERDTreeFind<CR>

"---------------------------------------------INDENT LINE CONFIGURATION

let g:indentLine_char_list = ['|', '¦']

"---------------------------------------------TERMINAL

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split && :terminal
  resize 5
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"-------------------------------------COC GLOBAL EXTENSIONS

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pyright']

"-------------------------------------CTRL P

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
nmap <leader>c :CtrlP<CR>

