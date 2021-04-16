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

call plug#begin()

"Themes
Plug 'ayu-theme/ayu-vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
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
"RAINBOW PARENTHESIS
Plug 'kien/rainbow_parentheses.vim'
"MULTIPLY CURSORS
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"VIM GITLENS
Plug 'APZelos/blamer.nvim'
"MARKDOWN PREVIEW
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"UTILITIES
Plug 'tpope/vim-fugitive'
"TERMINAL
Plug 'voldikss/vim-floaterm'

call plug#end()
"--------------------------------------------SHORTCUTS PLUGINS AND VIM

set encoding=UTF-8
nnoremap <leader>w :w <CR>
nnoremap <C-w> :q <CR>
nnoremap <leader>q :q <CR>
nnoremap <leader>so :so%<CR>
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

"---------------------------------------------THEME CONFIG

    if exists('+termguicolors')
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
      set termguicolors
    endif
let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_cursor = 'orange'
let g:gruvbox_material_background = 'hard'
 let g:gruvbox_material_disable_italic_comment = 1
"let ayucolor="dark" 
colorscheme gruvbox-material

"-------------------------------------------------LIGHTLINE CONFIG
let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
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

let g:clap_popup_cursor_shape       = ''
let g:clap_enable_background_shadow = v:false
let g:clap_current_selection_sign   = { 'text': '» ', 'texthl': 'ClapCurrentSelectionSign', 'linehl': 'ClapCurrentSelection' }
let g:clap_selected_sign            = { 'text': ' »', 'texthl': 'ClapSelectedSign', 'linehl': 'ClapSelected' }
let g:clap_prompt_format            = ' %spinner%%forerunner_status%%provider_id%:'
let g:clap_insert_mode_only   = v:true
let g:clap_disable_run_rooter = v:true
let g:clap_spinner_winid = 1011

nnoremap <leader>b :Clap filer<CR>
nnoremap <leader>c :Clap gfiles<CR>
nnoremap <leader>m :Clap commits<CR>

"-------------------------------------------------RAINBOW PARENTHESIS

let g:rbpt_colorpairs = [
    \ ['brown',       'Gold'],
    \ ['Darkblue',    'Orchid'],
    \ ['darkgray',    'LightSkyBlue'],
    \ ['darkgreen',   'Gold'],
    \ ['darkcyan',    'Orchid'],
    \ ['darkred',     'LightSkyBlue'],
    \ ['darkmagenta', 'Gold'],
    \ ['brown',       'Orchid'],
    \ ['gray',        'LightSkyBlue'],
    \ ['black',       'Gold'],
    \ ['darkmagenta', 'Orchid'],
    \ ['Darkblue',    'LightSkyBlue'],
    \ ['darkgreen',   'Gold'],
    \ ['darkcyan',    'Orchid'],
    \ ['darkred',     'LightSkyBlue'],
    \ ['red',         'Gold'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"------------------------------------------------INDENT LINE

let g:indentLine_char_list = ['|', '¦']

"------------------------------------------------COC EXPLORER CONFIG
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_matchit = 1

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '%APPDATA%\Local\nvim',
\   },
\   'cocConfig': {
\      'root-uri': '%APPDATA%\Local\nvim\coc-settings.json',
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
\   'git': {
\     'sources': [{'name': 'git', 'expand': v:true}]
\   },
\ }
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup coc-explorer
  if @% == '' || @% == '.'
    autocmd User CocNvimInit bd
    autocmd User CocNvimInit CocCommand explorer
  endif
augroup END
if exists('#User#CocGitStatusChange')
  doautocmd <nomodeline> User CocGitStatusChange
endif
nnoremap <leader>n :CocCommand explorer<CR>
nnoremap <leader>p :CocCommand explorer --preset floating<CR> 
"------------------------------------VIM - GITLENS

let g:blamer_enabled = 1

"-----------------------------------VIM MULTIPLY CURSORS

let g:multi_cursor_use_default_mapping=1

"----------------------------------MARKDOWN PREVIEW

nmap <C-s> <Plug>MarkdownPreview
nnoremap <M-s> <Plug>MarkdownPreviewStop
nnoremap <C-p> <Plug>MarkdownPreviewToggle

"---------------------------------FLOATERM

nnoremap <leader>t :FloatermToggle<CR>
nnoremap <leader>tt :FloatermKill<CR>

