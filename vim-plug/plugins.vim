call plug#begin()
" Temas
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
"Nerdtree
Plug 'preservim/nerdtree'|
      \ Plug 'Xuyuanp/nerdtree-git-plugin' |
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
"Indent 
Plug 'yggdroot/indentline'
"Files
Plug 'SergioRibera/vim-files'
"FUZZY FINDER
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"NERD COMMENTER
Plug 'preservim/nerdcommenter' 
"JEDI
Plug 'davidhalter/jedi-vim'
"Bracket Coloraizer
Plug 'luochen1990/rainbow'
call plug#end()

