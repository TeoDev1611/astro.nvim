
"------------------------------------------------------------------------------"
"                              Vim Plug Plugin Manager                         "
"------------------------------------------------------------------------------"

let g:coc_load = 1
let g:native_lsp = 0
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

if g:native_lsp
  lua require('lsp/lsp-servers') require('lsp/compe') require('lsp/icons') require('lsp/saga')
endif

if g:coc_load
  if has('win32') || has('win64')
    source ~/appdata/local/nvim/coc.vim
  elseif has('linux') || has('osxdarwin')
    source ~/.config/nvim/coc.vim'
  else
    echoerr "Platform Unsupported"
  endif
endif


"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Utils for manager                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

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
call plug#begin('~/.cache/plugs')

"------------------------------------------------------------------------------"
"                                 LSP Settings                                 "
"------------------------------------------------------------------------------"

if exists('g:coc_load')
  if  g:coc_load
   Plug 'neoclide/coc.nvim', {'branch': 'release'} "Intellj Sense
  endif
endif
if exists('g:native_lsp')
  if g:native_lsp
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'folke/lsp-colors.nvim'
  endif
endif

"------------------------------------------------------------------------------"
"                                IDE Completion                                "
"------------------------------------------------------------------------------"

if exists('g:ide_tools')
  if g:ide_tools
    Plug 'tpope/vim-commentary'
    Plug 'jiangmiao/auto-pairs' " Close Brackets
    Plug 'tpope/vim-fugitive' " Git integration
    Plug 'folke/which-key.nvim'  " Help panel for the commands
    Plug 'cometsong/CommentFrame.vim'
    Plug 'bitc/vim-bad-whitespace' " Show the bad whitespace good boy
    Plug 'mbbill/undotree', {
	\ 'on': 'UndotreeToggle',
    \ } " Undo tree be improved for the history
  endif
endif

"------------------------------------------------------------------------------"
"                                Languages tools                               "
"------------------------------------------------------------------------------"

if exists('g:rust_lang')
  if g:rust_lang
    Plug 'rust-lang/rust.vim', {
	  \  'for': 'rust',
	  \} " RustLang setup
  endif
endif

if exists('g:elixir_lang')
  if g:elixir_lang
    Plug 'elixir-editors/vim-elixir', {
	  \  'for': 'elixir',
	  \} " Elixir Setup
    Plug 'mhinz/vim-mix-format', {
	  \  'for': 'elixir',
	  \} " Mix Elixir Formatter
  endif
endif

if exists('g:python_lang')
  if g:python_lang
    Plug 'ambv/black', {
	\ 'on': 'Black',
	\ 'for': 'python',
    \ } " Python Formmatter black for everyone
  endif
endif

if exists('g:editor_config')
  if g:editor_config
    Plug 'editorconfig/editorconfig-vim'
  endif
endif

if exists('g:powershell_lang')
  if g:powershell_lang
    Plug 'pprovost/vim-ps1'
  endif
endif

"------------------------------------------------------------------------------"
"                             Colors and Aparience                             "
"------------------------------------------------------------------------------"

if exists('g:colors_tools')
  if g:colors_tools
    Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'} " Syntax no more bad themes
    Plug 'kyazdani42/nvim-web-devicons' " Icons with the Lua Power
    Plug 'marko-cerovac/material.nvim' " For the not Gruvbox Lovers
    Plug 'hoob3rt/lualine.nvim' " Status Line Lua Faster
    Plug 'rktjmp/lush.nvim' " Theme Maker required by Gruvbox
    Plug 'npxbr/gruvbox.nvim' " Gruvbox theme with lua power
    Plug 'RRethy/vim-illuminate' " Let the light be made highlight the words
    Plug 'rbtnn/vim-vimscript_indentexpr', {
	  \'for':'vim'
	  \} " Correct indent of the beautifull vim script
    Plug 'preservim/nerdtree' |
		\ Plug 'Xuyuanp/nerdtree-git-plugin' |
		\ Plug 'ryanoasis/vim-devicons'
  endif
endif

"------------------------------------------------------------------------------"
"                                 Usefull Tools                                "
"------------------------------------------------------------------------------"

if exists('g:usefull_ide')
  if g:usefull_ide
    Plug 'junegunn/goyo.vim', {
	  \ 'on':  'Goyo',
	  \} " Zen Mode Peace in your heart
    Plug 'tweekmonster/startuptime.vim', {
	\ 'on': 'StartupTime',
    \ } " A ms is the live !
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} 
  endif
endif


"------------------------------------------------------------------------------"
"                               Rocket Aparience                               "
"------------------------------------------------------------------------------"

if exists('g:rocket_aparience')
  if g:rocket_aparience
    Plug 'mg979/vim-visual-multi' " Multiple cursors your a octoman
    Plug 'psliwka/vim-smoothie' " Beautifull scroll for the aesthetics
    Plug 'mhinz/vim-startify'
    Plug 'andweeb/presence.nvim'
  endif
endif


"------------------------------------------------------------------------------"
"                                 Fuzzy finding                                "
"------------------------------------------------------------------------------"

if exists('g:fuzzy_find')
  if g:fuzzy_find
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
  endif
endif

"------------------------------------------------------------------------------"
"                             End Plugin Managment                             "
"------------------------------------------------------------------------------"

call plug#end()
