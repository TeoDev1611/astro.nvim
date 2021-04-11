"---------------------------------VIM CONFIGURATION----------------------------
syntax on
filetype plugin indent on
set nocompatible
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

"Exit insert Mode
imap jk <Esc>
imap <C-c> <Esc>l
"Move Code Blocks in V mode and V-LINE
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv 
"INDENTATION
vnoremap < <gv
vnoremap > >gv
"MOVE IN BUFFERS
nmap <silent> <C-left> :wincmd h<CR>
nmap <silent> <C-right> :wincmd l<CR>
nmap <silent> <C-up> :wincmd k<CR>
nmap <silent> <C-down> :wincmd j<CR>
call plug#begin()
"Themes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
"Indent Line
Plug 'Yggdroot/indentLine'
"ICONS
Plug 'ryanoasis/vim-devicons'
"Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"COC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"      SYTAXYS 
Plug 'sheerun/vim-polyglot'
"       "NERD COMMENTER
Plug 'preservim/nerdcommenter' 
"VIM PAIRS
Plug 'jiangmiao/auto-pairs'
" RUST 
Plug 'rust-lang/rust.vim'
"PYTHON SINTAX
Plug 'jeetsukumaran/vim-pythonsense'
"vim go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Clap Filer
Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
"SEMSHI PYTHON
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for': 'python' }
"RUBY
Plug 'vim-ruby/vim-ruby'
"RAINBOW PARENTHESIS
Plug 'kien/rainbow_parentheses.vim'
"DEFX
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } | Plug 'kristijanhusak/defx-icons' | Plug 'kristijanhusak/defx-git'
else
  Plug 'Shougo/defx.nvim' | Plug 'kristijanhusak/defx-icons' | Plug 'kristijanhusak/defx-git'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
"MULTIPLY CURSORS
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"VIM GITLENS
Plug 'APZelos/blamer.nvim'
"MARKDOWN PREVIEW
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"UTILITIES
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
call plug#end()
"--------------------------------------------SHORTCUTS PLUGINS AND VIM
"ENCODING DEV ICONS
set encoding=UTF-8
"SAVE FILE
nmap <leader>w :w <CR>
"CLOSE WINDOWS
nmap <C-w> :q <CR>
nmap <leader>q :q <CR>
"UPDATE
nmap <leader>so :so%<CR>

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
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_cursor = 'orange'
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
"-------------------------------------------------AIRLINE CONFIG
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#coc#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme = 'gruvbox_material'
set showtabline=2
set noshowmode

"------------------------------------------------VIML CONFIG

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"------------------------------------------------COC-PRETTIER

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"-------------------------------------------GLOBAL COC EXPLORER EXTENSIONS

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pyright']

"----------------------------------------------------- VIM CLAP

let g:clap_popup_cursor_shape       = ''
let g:clap_enable_background_shadow = v:false
let g:clap_current_selection_sign   = { 'text': '» ', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
let g:clap_selected_sign            = { 'text': ' »', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
let g:clap_prompt_format            = ' %spinner%%forerunner_status%%provider_id%:'
let g:clap_insert_mode_only   = v:true
let g:clap_disable_run_rooter = v:true
let g:clap_spinner_winid = 1011

nmap <leader>b :Clap filer<CR>
nmap <leader>c :Clap gfiles<CR>
nmap <leader>m :Clap commits<CR>

"-------------------------------------------------RAINBOW PARENTHESIS

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"------------------------------------------------INDENT LINE

let g:indentLine_char_list = ['|', '¦']

"------------------------------------------------DEFX FILE EXPLORER
 	autocmd BufEnter,VimEnter,BufNew,BufWinEnter,BufRead,BufCreate
	      \ * if isdirectory(expand('<amatch>'))
	      \   | call s:browse_check(expand('<amatch>')) | endif
	
	function! s:browse_check(path) abort
	  if bufnr('%') != expand('<abuf>')
	    return
	  endif
	
	  " Disable netrw.
	  augroup FileExplorer
	    autocmd!
	  augroup END
	
	  execute 'Defx' a:path
	endfunction

function! s:setcolum() abort
 return 'mark:indent:git:icons:filename'
endfunction
 
call defx#custom#option('_', {
      \ 'columns': s:setcolum(),
      \ 'winwidth': 40,
      \ 'split': 'vertical',
      \ 'direction': 'leftabove',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
 
call defx#custom#column('mark', {
      \ 'readonly_icon': '',
      \ 'selected_icon': '',
      \ })
 
call defx#custom#column('icon', {
      \ 'directory_icon': '▶',
      \ 'opened_icon': '▼',
      \ 'root_icon': ' ',
      \ })
 
call defx#custom#column('filename', {
      \ 'max_width': -90,
      \ })
 
augroup vfinit
  au!
  autocmd FileType defx call s:defx_init()
  " auto close last defx windows
  autocmd BufEnter * nested if
        \ (!has('vim_starting') && winnr('$') == 1 
        \ && &filetype ==# 'defx') |
        \ call s:close_last_vimfiler_windows() | endif
augroup END
 
function! s:close_last_vimfiler_windows() abort
  exe 'silent bd!'
  q
endfunction
 
function! s:defx_init()
  setl nonumber
  setl norelativenumber
  setl listchars=
  setl nofoldenable
  setl foldmethod=manual
 
  nnoremap <silent><buffer><expr> <space>
        \ defx#do_action('toggle_select') . 'j'
  " Define mappings
  nnoremap <silent><buffer><expr> gx
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> <Cr>
        \ defx#is_directory() ?
        \ defx#do_action('open_or_close_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> sg
        \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> sv
        \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> st
        \ defx#do_action('drop', 'tabedit')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy defx#do_action('call', 'DefxYarkPath')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-r>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> > defx#do_action('resize',
      \ defx#get_context().winwidth + 10)
  nnoremap <silent><buffer><expr> < defx#do_action('resize',
      \ defx#get_context().winwidth - 10)
endfunction
 
 
function! DefxYarkPath(_) abort
  let candidate = defx#get_candidate()
  let @+ = candidate['action__path']
  echo 'yanked: ' . @+
endfunction
 
"DEFX GIT
let g:defx_git#indicators = {
    \ 'Modified'  : '•',
    \ 'Staged'    : '✚',
    \ 'Untracked' : 'ᵁ',
    \ 'Renamed'   : '≫',
    \ 'Unmerged'  : '≠',
    \ 'Ignored'   : 'ⁱ',
    \ 'Deleted'   : '✖',
    \ 'Unknown'   : '⁇'
    \ }
 
"REMAP DEFX
nmap <Leader>n :Defx<CR>

"------------------------------------VIM - GITLENS

let g:blamer_enabled = 1

"-----------------------------------VIM MULTIPLY CURSORS

let g:multi_cursor_use_default_mapping=1

"----------------------------------MARKDOWN PREVIEW
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
