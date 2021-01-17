"---------------------------------vim config----------------------------
syntax enable
set number
set mouse=a
set relativenumber
set clipboard=unnamed
set showcmd
set ruler
set showmatch
set sw=2
let mapleader = " "
set laststatus=2
set backspace=2
set guioptions-=T
set guioptions-=L
"Prettier Config
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"Salir de modo insertar
imap jk <Esc>
imap <C-c> <Esc>l
"mueve bloques de codigo en modo visual o V-Line
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv 

" Mejor Indentación
vnoremap < <gv
vnoremap > >gv

"-------------------------------Plugins-------------------------------
"Plugins
call plug#begin()
" Temas
Plug 'morhetz/gruvbox'
Plug 'ackyshake/spacegray.vim'
Plug 'dikiaap/minimalist'
 "Nerdtree
Plug 'preservim/nerdtree'|
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
	    \ Plug 'ryanoasis/vim-devicons'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" VERSION ESTABLE DE COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Cerrar los pares () [] {} '' 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
"PYTHON
Plug 'vim-python/python-syntax'
"Emmet
Plug 'mattn/emmet-vim'
"MAS TEMAS
"Auto Cambio de pares
Plug 'tpope/vim-surround'
"JEDI
Plug 'davidhalter/jedi-vim'
call plug#end()

"--------------------------------Plugins Config--------------------------------------------
"ENCODING DEV ICONS
set encoding=UTF-8
"guardar archivo
nmap <leader>w :w <CR>
"cerrar ventana
nmap <C-w> :q <CR>
nmap <leader>q :q <CR>
nmap <leader>so :so%<CR>
"comandos de busqueda
nmap <leader>gs  :CocSearch

"Cerrar Nerdtree
nmap <Leader>qt :NERDTreeClose<CR>
"Abrir Nerdtree
nmap <Leader>nt :NERDTreeFind<CR>

" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB para ir a atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
"cerrar buffer
nmap <leader>bd :bdelete<CR>
"Config Colores
colorscheme spacegray
set noshowmode
let g:airline_theme= 'minimalist'

"Tab airline 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
set showtabline=2
"POWER LINE FONTS
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"Cerrar tags automaticamente
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
"-----------------------------------------------------------------
"GITHUB CONFIG
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

