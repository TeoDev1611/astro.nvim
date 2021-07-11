
"------------------------------------------------------------------------------"
"                              Dein Plugin Manager                             "
"------------------------------------------------------------------------------"

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

Plug 'jiangmiao/auto-pairs' " Close Brackets
Plug 'tpope/vim-fugitive' " Git integration
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Intellj Sense
Plug 'tpope/vim-commentary', {'on': 'Commentary'}
Plug 'marko-cerovac/material.nvim' " For the not Gruvbox Lovers
Plug 'folke/which-key.nvim', {'on': 'WhichCase'} " Help panel for the commands
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', {'for':'go'} " Golang setup
Plug 'rust-lang/rust.vim', {
      \  'for': 'rust',
      \} " RustLang setup
Plug 'elixir-editors/vim-elixir', {
      \  'for': 'elixir',
      \} " Elixir Setup
Plug 'mhinz/vim-mix-format', {
      \  'for': 'elixir',
      \} " Mix Elixir Formatter
Plug 'junegunn/goyo.vim', {
      \ 'on':  'Goyo',
      \} " Zen Mode Peace in your heart
Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'} " Syntax no more bad themes
Plug 'kyazdani42/nvim-web-devicons' " Icons with the Lua Power
Plug 'hoob3rt/lualine.nvim' " Status Line Lua Faster
Plug 'rktjmp/lush.nvim' " Theme Maker required by Gruvbox
Plug 'npxbr/gruvbox.nvim' " Gruvbox theme with lua power
Plug 'cometsong/CommentFrame.vim' 
Plug 'RRethy/vim-illuminate' " Let the light be made highlight the words
Plug 'ambv/black', {
    \ 'on': 'Black',
    \ 'for': 'python',
\ } " Python Formmatter black for everyone
Plug 'bitc/vim-bad-whitespace' " Show the bad whitespace good boy
Plug 'junegunn/fzf', {
    \ 'on': 'FZF',
\ } " Fuzzy search yeah the clasic FZF
Plug 'junegunn/fzf.vim' " More FZF with turbo vim power epic!
Plug 'mbbill/undotree', {
    \ 'on': 'UndotreeToggle',
\ } " Undo tree be improved for the history
Plug 'rbtnn/vim-vimscript_indentexpr', {
      \'for':'vim'
      \} " Correct indent of the beautifull vim script
Plug 'glepnir/dashboard-nvim' " A beautiful welcome fit for kings
Plug 'tweekmonster/startuptime.vim', {
    \ 'on': 'StartupTime',
\ } " A ms is the live !
Plug 'kyazdani42/nvim-tree.lua', {
    \ 'on': ['NvimTreeToggle', 'NvimTreeFindFile']
\} " For the aesthetics tree toggle with the lua power
Plug 'mg979/vim-visual-multi' " Multiple cursors your a octoman
Plug 'psliwka/vim-smoothie' " Beautifull scroll for the aesthetics

call plug#end()
