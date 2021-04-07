"---------------------------------VIM CONFIGURATION----------------------------
syntax on
filetype plugin indent on
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
"------------------------------------------PLUGINS VIM
call plug#begin()
" Temas
Plug 'morhetz/gruvbox'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
"Indent Line
Plug 'Yggdroot/indentLine'
"ICONS
Plug 'ryanoasis/vim-devicons'
"Light Line
 Plug 'itchyny/lightline.vim'
 Plug 'itchyny/vim-gitbranch'
Plug 'josa42/vim-lightline-coc'
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
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
"-------------------------------------------------LIGHTLINE CONFIG
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [[  'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ]]
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
" register compoments:
call lightline#coc#register()

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

let g:clap_layout                   = { 'relative': 'editor', 'width': '65%', 'height': '45%',  'row': '15%', 'col': '15%' }
let g:clap_popup_cursor_shape       = ''
let g:clap_preview_direction        = 'UD'
let g:clap_search_box_border_style  = 'nil'
let g:clap_enable_background_shadow = v:false
let g:clap_current_selection_sign   = { 'text': '» ', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
let g:clap_selected_sign            = { 'text': ' »', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
let g:clap_prompt_format            = ' %spinner%%forerunner_status%%provider_id%:'

let g:clap_insert_mode_only   = v:true
let g:clap_disable_run_rooter = v:true
    let g:clap_spinner_winid = 1011

nmap <leader>n :Clap filer<CR>
nmap <leader>c :Clap gfiles<CR>
nmap <leader>m :Clap commits<CR>
