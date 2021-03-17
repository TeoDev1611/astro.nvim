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
"Indent Line
Plug 'Yggdroot/indentLine'
"ICONS
Plug 'ryanoasis/vim-devicons'
"Light Line
 Plug 'itchyny/lightline.vim'
 Plug 'itchyny/vim-gitbranch'
 "VERSION ESTABLE DE COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"      SYTAXIS EXTRA
Plug 'sheerun/vim-polyglot'
"       "NERD COMMENTER
Plug 'preservim/nerdcommenter' 
"Float Term
Plug 'voldikss/vim-floaterm'
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
"Bracket Coloraizer
Plug 'luochen1990/rainbow'
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
"Uninstall Command
nmap <leader>pc :PlugClean<CR>
"---------------------------------------------THEME CONFIG
set termguicolors
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
"--------------------------------------------------AIRLINE CONFIG
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'tab_component_function': {
      \   'tabnum': 'LightlineWebDevIcons',
      \ },
      \ }

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction
set showtabline=2
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
set noshowmode

"------------------------------------------------VIML CONFIG

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"------------------------------------------------COC-PRETTIER

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"------------------------------------------------NERD TREE
"Abrir Nerdtree
nmap <Leader>n :NERDTreeFind<CR>
"MINIMAL UI
let NERDTreeMinimalUI = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \}
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0"
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0"

"---------------------------------------------INDENT LINE CONFIGURATION
let g:indentLine_char_list = ['|', '¦']

"-----------------------------------------------FLOATERM REMAP
nmap<leader>m :FloatermToggle<CR>

