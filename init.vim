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
"UTILITIES
Plug 'tpope/vim-fugitive'
"TERMINAL
Plug 'voldikss/vim-floaterm'
 " Fern
Plug 'lambdalisue/fern.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'
" FZF
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
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
colorscheme gruvbox-material

"-------------------------------------------------LIGHTLINE CONFIG
let g:lightline = {
    \ 'colorscheme': 'gruvbox_material',
    \ 'active': {
    \   'tabline': 0,
    \   'left': [['mode', 'paste'], ['gitbranch'], ['readonly', 'filename', 'modified']],
    \   'right': [['coc_status'], [  'coc_info', 'coc_hints', 'coc_errors', 'coc_warnings', 'coc_ok' ] ,['filetype', 'percent', 'lineinfo'], ['signify']]
    \ },
    \ 'inactive': {
    \   'left': [['inactive'], ['gitbranch'], ['relativepath'], ['signify']],
    \   'right': [['bufnum']]
    \ },
    \ 'component': {
    \   'bufnum': '%n',
    \   'inactive': 'inactive'
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name',
    \   'readonly': 'LightlineReadonly',
    \   'filetype': 'MyFiletype',
    \   'filename': 'MyFileName',
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_info': 'info',
    \   'linter_hints': 'hints',
    \   'linter_ok': 'left', 
    \ },
    \ 'subseparator': {
    \   'left': '',
    \   'right': ''
    \ },
    \ 'tab_component_function': {
    \   'tabnum': 'LightlineWebDevIcons',
    \ },
    \}
" Lightline settings
autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
let g:lightline#hunks#hunk_symbols = [ '+', '~', '-' ]
let g:lightline#hunks#only_branch = 1
let g:lightline#hunks#exclude_filetypes = [ 'fern' , 'startify', 'nerdtree', 'vista_kind', 'tagbar'  ]
function! LightlineReadonly()
    return &readonly && &filetype !=# 'help' ? '' : ''
endfunction
function! MyFiletype()
    return strlen(&filetype) ? WebDevIconsGetFileTypeSymbol().' '.&filetype : 'no ft'
endfunction
function! MyFileName()
    return WebDevIconsGetFileTypeSymbol().' '.expand('%:t')
endfunction

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

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pyright', 'coc-git']

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

"------------------------------------------------FERN EXPLORER CONFIG

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
" Disable listing ignored files/directories
let g:fern_git_status#disable_ignored = 1

" Disable listing untracked files
let g:fern_git_status#disable_untracked = 1

" Disable listing status of submodules
let g:fern_git_status#disable_submodules = 1

" Disable listing status of directories
let g:fern_git_status#disable_directories = 1

noremap <silent> <C-m> :Fern . -reveal=%<CR>
nmap <leader>n :Fern . -drawer -reveal=% -toggle -width=30<CR>



"------------------------------------INDENT LINE

let g:indentLine_char_list = ['|', '¦']

"------------------------------------VIM - GITLENS

let g:blamer_enabled = 1

"-----------------------------------VIM MULTIPLY CURSORS

let g:multi_cursor_use_default_mapping=1

"---------------------------------FLOATERM

nnoremap <leader>t :FloatermToggle<CR>

"------------------------------VIM GOLANG

filetype plugin indent on

set autowrite

"Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" Map keys for most used commands.
" Ex: `\b` for building, `\r` for running and `\b` for running test.
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)



"---------------------------------------- TELESCOPE

lua << EOF

local cmd = vim.cmd

cmd("nnoremap <leader>f :Telescope file_browser<CR>")
cmd("nnoremap <leader>fb :Telescope git_branches<CR>")
cmd("nnoremap <leader>fc :Telescope git_commits<CR>")

EOF

