
"------------------------------------------------------------------------------"
"                              Vim Plug Plugin Manager                         "
"------------------------------------------------------------------------------"
let g:coc_load = 0
let g:native_lsp = 1
let g:elixir_lang = 1
let g:rust_lang = 1
let g:python_lang = 1
let g:powershell_lang = 1
let g:editor_config = 1
let g:rocket_aparience = 1
let g:ide_tools = 1
let g:usefull_ide = 1
let g:colors_tools = 1
let g:fuzzy_find = 1
let g:golang_lang = 1

if g:coc_load
  if has('win32') || has('win64')
    source ~/appdata/local/nvim/lightline.vim
    " source ~/appdata/local/nvim/coc.vim
  elseif has('linux') || has('osxdarwin')
    " source ~/.config/nvim/coc.vim
    source ~/.config/nvim/lightline.vim
  else
    echoerr "Platform Unsupported"
  endif
endif


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Utils for manager                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/rocket/repos/github.com/Shougo/dein.vim

" Prefix your commands
function! s:prefix(str, args) abort
    return map(a:args, {_, s -> a:str . s})
endfunction

" Same as prefix but after :)
function! s:suffix(str, args) abort
    return map(a:args, {_, s -> s . a:str})
endfunction

" Caching the executable function
let s:has_exec_cache = {}
function! s:has_exec(command) abort
    if !has_key(s:has_exec_cache, a:command)
        let s:has_exec_cache[a:command] = executable(a:command)
    endif
    return s:has_exec_cache[a:command]
endfunction


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                             Plugin Manager start                             "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

"START LOAD PLUGIN FUNCTION
call dein#begin('~/.cache/rocket')

call dein#add('haya14busa/dein-command.vim', {'on_cmd':'Dein'})

"------------------------------------------------------------------------------"
"                                 LSP Settings                                 "
"------------------------------------------------------------------------------"

if exists('g:coc_load')
  if g:coc_load
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-file.vim')
  call dein#add('prabirshrestha/asyncomplete-emmet.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('mattn/vim-lsp-icons')
 endif
endif
if exists('g:native_lsp')
  if g:native_lsp
    call dein#add('neovim/nvim-lspconfig')
    call dein#add('hrsh7th/nvim-compe')
    call dein#add('glepnir/lspsaga.nvim')
    call dein#add('hrsh7th/vim-vsnip')
    call dein#add('hrsh7th/vim-vsnip-integ')
    call dein#add('folke/lsp-colors.nvim')
  endif
endif

"------------------------------------------------------------------------------"
"                                IDE Completion                                "
"------------------------------------------------------------------------------"

if exists('g:ide_tools')
  if g:ide_tools
    call dein#add('tpope/vim-commentary', { 'on_cmd':'Commentary', 'on_map': 'gc' })
    call dein#add('jiangmiao/auto-pairs') " Close Brackets
    call dein#add('tpope/vim-fugitive',{
    \ 'on_cmd':'G'
    \}) " Git integration
    call dein#add('cometsong/CommentFrame.vim')
    call dein#add('mbbill/undotree', {
	\ 'on_cmd': 'UndotreeToggle',
    \ }) " Undo tree be improved for the history
  endif
endif

"------------------------------------------------------------------------------"
"                                Languages tools                               "
"------------------------------------------------------------------------------"

if exists('g:rust_lang')
  if g:rust_lang
    call dein#add('rust-lang/rust.vim', {
	  \  'on_ft': 'rust',
	  \}) " RustLang setup
  endif
endif

if exists('g:elixir_lang')
  if g:elixir_lang
    call dein#add('elixir-editors/vim-elixir', {
	  \  'on_ft': 'elixir',
	  \}) " Elixir Setup
    call dein#add('mhinz/vim-mix-format', {
	  \  'on_ft': 'elixir',
	  \}) "Mix Elixir Formatter
  endif
endif

if exists('g:python_lang')
  if g:python_lang
    call dein#add('ambv/black', {
	\ 'on_cmd': 'Black',
	\ 'on_ft': 'python',
    \ }) " Python Formmatter black for everyone
  endif
endif

if exists('g:editor_config')
  if g:editor_config
    call dein#add('editorconfig/editorconfig-vim')
  endif
endif

if exists('g:powershell_lang')
  if g:powershell_lang
    call dein#add('pprovost/vim-ps1',{
    \ 'on_ft':'powershell'
    \})
  endif
endif

if exists('g:golang_lang')
  if g:golang_lang
    call dein#add('fatih/vim-go', {
    \'on_ft':'go'
    \})
  endif
endif

"------------------------------------------------------------------------------"
"                             Colors and Aparience                             "
"------------------------------------------------------------------------------"

if exists('g:colors_tools')
  if g:colors_tools
    call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'}) " Syntax no more bad themes
    call dein#add('p00f/nvim-ts-rainbow')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('kyazdani42/nvim-web-devicons')
    call dein#add('rafi/awesome-vim-colorschemes')
    call dein#add('itchyny/lightline.vim')
    call dein#add('rbtnn/vim-vimscript_indentexpr', {
	  \'on_ft':'vim'
	  \}) " Correct indent of the beautifull vim script
    "Fern
    call dein#add('lambdalisue/fern.vim')
    call dein#add('antoinemadec/FixCursorHold.nvim')
    call dein#add('lambdalisue/fern-renderer-nerdfont.vim')
    call dein#add('lambdalisue/nerdfont.vim')
    call dein#add('lambdalisue/glyph-palette.vim')
  endif
endif

"------------------------------------------------------------------------------"
"                                 Usefull Tools                                "
"------------------------------------------------------------------------------"

if exists('g:usefull_ide')
  if g:usefull_ide
    call dein#add('junegunn/goyo.vim', {
	  \ 'on_cmd':  'Goyo',
	  \}) " Zen Mode Peace in your heart
    call dein#add('tweekmonster/startuptime.vim', {
	\ 'on_cmd': 'StartupTime',
    \ }) " A ms is the live !
  call dein#add('iamcco/markdown-preview.nvim', { 'hook_post_update': { -> mkdp#util#install() }, 'on_ft': ['markdown', 'vim-plug']})
  endif
endif


"------------------------------------------------------------------------------"
"                               Rocket Aparience                               "
"------------------------------------------------------------------------------"

if exists('g:rocket_aparience')
  if g:rocket_aparience
    " Plug 'mg979/vim-visual-multi' " Multiple cursors your a octoman
    call dein#add('psliwka/vim-smoothie') " Beautifull scroll for the aesthetics
    call dein#add('mhinz/vim-startify', {'on_cmd':'Startify'})
    call dein#add('andweeb/presence.nvim')
  endif
endif


"------------------------------------------------------------------------------"
"                                 Fuzzy finding                                "
"------------------------------------------------------------------------------"

if exists('g:fuzzy_find')
  if g:fuzzy_find
    call dein#add('nvim-lua/popup.nvim')
    call dein#add('nvim-lua/plenary.nvim')
    call dein#add('nvim-telescope/telescope.nvim', { 'on_cmd':'Telescope' })
  endif
endif

"------------------------------------------------------------------------------"
"                             End Plugin Managment                             "
"------------------------------------------------------------------------------"

call dein#end()

if g:native_lsp
  lua require('lsp/lsp-servers') require('lsp/compe') require('lsp/icons') require('lsp/saga') require('ide/telescope')

  if has('win32') || has('win64')
    source ~/appdata/local/nvim/lightline.vim
  elseif has('linux') || has('osxdarwin')
    source ~/.config/nvim/lightline.vim
  else
   echoerr "Platform Unsupported"
  endif
endif
