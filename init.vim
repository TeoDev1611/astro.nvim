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
Plug 'sainnhe/sonokai'
Plug 'dikiaap/minimalist'
Plug 'sheerun/vim-polyglot'
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
Plug 'hdima/python-syntax'
"Emmet
Plug 'mattn/emmet-vim'
"MAS TEMAS
"Auto Cambio de pares
Plug 'tpope/vim-surround'
"Git Fugitive
Plug 'tpope/vim-fugitive'
"Vim Hex Color
Plug 'etdev/vim-hexcolor'
"Indent 
Plug 'yggdroot/indentline'
"Files
Plug 'SergioRibera/vim-files'
"FUZZY FINDER
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Multiple Cursors
Plug 'terryma/vim-multiple-cursors'
"NERD COMMENTER
Plug 'preservim/nerdcommenter' 
"JEDI
Plug 'davidhalter/jedi-vim'
"Bracket Coloraizer
Plug 'luochen1990/rainbow'
"Rust
Plug 'rust-lang/rust.vim'
"FLOAT TERM
Plug 'voldikss/vim-floaterm'
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
nmap <leader>gs  :CocSearch<CR>
nmap <leader>fz  :FZF<CR>


"Cerrar Nerdtree
nmap <Leader>qt :NERDTreeClose<CR>
"Abrir Nerdtree
nmap <Leader>nt :NERDTreeFind<CR>
"MINIMAL UI
let NERDTreeMinimalUI = 1

"PLUG ATAJOS
nmap <Leader>pi :PlugInstall<CR>
nmap <Leader>pc :PlugClean<CR>

" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB para ir a atras 
nnoremap <silent> <S-TAB> :bprevious<CR>
"cerrar buffer
nmap <leader>bd :bdelete<CR>
"Config Colores
"colorscheme gruvbox
"let g:airline_theme = 'gruvbox'
"let g:gruvbox_contrast_dark = 'medium'

colorscheme sonokai
let g:airline_theme = 'sonokai'

"TAB airline 
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

"Indent
let g:indentLine_enabled = 1
let g:indentLine_char = '|'
let g:indentLine_faster = 1
"VIML
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"VIM-FILES
" Dirs
noremap <leader>cd :call VimFiles#DirCreate()<Cr>
" File
noremap <leader>cf :call VimFiles#FileCreate()<Cr> 
" File in Vertical Window
noremap <leader>cv :call VimFiles#FileCreateVS()<Cr>
"File in current Window
noremap <leader>cw :call VimFiles#FileCreateCW()<Cr>
"File in Tab
noremap <leader>ct :call VimFiles#FileCreateTab()<CR>
" Manipulate Rename Files
noremap <leader>rw :call VimFiles#ManipulateRenameCurrentFile()<Cr>
noremap <leader>rf :call VimFiles#ManipulateRenameFile()<Cr>
" Manipulate Move Files
noremap <leader>mw :call VimFiles#ManipulateMoveCurrentFile()<Cr>
noremap <leader>mf :call VimFiles#ManipulateMoveFile()<Cr>
" Manipulate Delete Files
noremap <leader>dw :call VimFiles#ManipulateDeleteCurrentFile()<Cr>
noremap <leader>df :call VimFiles#ManipulateDeleteFile()<Cr>
  
"Bracket Coloraizer Activate
 let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"Rust Auto Save
"
let g:rustfmt_autosave = 1
"TERMINAL
nnoremap <Leader>tm :FloatermNew<CR>
nnoremap <leader>tc :FloatermKill<CR>
