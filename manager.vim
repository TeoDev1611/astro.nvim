
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

if &compatible
  set nocompatible               " Be iMproved
endif

" RUNTIMEPATH FOR THE MANAGER
set runtimepath+=~\.cache\dein\repos\github.com\Shougo\dein.vim

"START LOAD PLUGIN FUNCTION
call dein#begin('~\.cache\dein')

call dein#add('Shougo/dein.vim')
call dein#add('wsdjeg/dein-ui.vim', {
      \ 'on_cmd': 'DeinUpdate'
      \}) " Dein Update UI
call dein#add('jiangmiao/auto-pairs') " Close Brackets
call dein#add('tpope/vim-fugitive', {
    \ 'if': s:has_exec('git'),
\ }) " Git integration
call dein#add('neoclide/coc.nvim', {
      \'merged': 0,
      \  'if':  s:has_exec('node') && s:has_exec('git'),
      \}) " Intellj Sense
call dein#add('tpope/vim-commentary', {
    \ 'on_cmd': 'Commentary',
    \ 'on_map': 'gc',
\ }) " Comments Easy
call dein#add('marko-cerovac/material.nvim') " For the not Gruvbox Lovers
call dein#add('folke/which-key.nvim', {
      \ 'on_cmd':'WhichKey',
      \}) " Help panel for the commands
call dein#add('editorconfig/editorconfig-vim', {
    \ 'if': has('pythonx'),
    \ 'on_event': 'InsertEnter',
    \ 'on_path': '.editorconfig',
\ }) " Editor Config Files
call dein#add('fatih/vim-go', {
      \  'on_ft': 'go',
      \  'if': s:has_exec('go') && s:has_exec('git'),
      \}) " Golang setup
call dein#add('rust-lang/rust.vim', {
      \  'on_ft': 'rust',
      \  'if': s:has_exec('rustc') &&  s:has_exec('cargo') && s:has_exec('git'),
      \}) " RustLang setup
call dein#add('elixir-editors/vim-elixir', {
      \  'on_ft': 'elixir',
      \   'if': s:has_exec('mix') && s:has_exec('elixir') && s:has_exec('git'),
      \}) " Elixir Setup
call dein#add('mhinz/vim-mix-format', {
      \  'on_ft': 'elixir',
      \   'if': s:has_exec('mix') && s:has_exec('elixir') && s:has_exec('git'),
      \}) " Mix Elixir Formatter
call dein#add('junegunn/goyo.vim', {
      \ 'on_cmd':  'Goyo',
      \}) " Zen Mode Peace in your heart
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'}) " Syntax no more bad themes
call dein#add('kyazdani42/nvim-web-devicons') " Icons with the Lua Power
call dein#add('hoob3rt/lualine.nvim') " Status Line Lua Faster
call dein#add('rktjmp/lush.nvim') " Theme Maker required by Gruvbox
call dein#add('npxbr/gruvbox.nvim') " Gruvbox theme with lua power
call dein#add('cometsong/CommentFrame.vim', {
        \'on_cmd': s:prefix('Comment', ['FrameSlashes','FrameSlashStar', 'FrameHashDash', 'FrameHashEqual',  'FrameQuoteDash', 'FrameQuoteTilde'])
	\}) " Beautifull Comment sections
call dein#add('RRethy/vim-illuminate') " Let the light be made highlight the words
call dein#add('ambv/black', {
    \ 'if': v:version >= 704 && has('python3') && s:has_exec('black'),
    \ 'on_cmd': 'Black',
    \ 'on_ft': 'python',
\ }) " Python Formmatter black for everyone
call dein#add('bitc/vim-bad-whitespace', {
    \ 'on_cmd': s:suffix('BadWhitespace', ['Erase', 'Hide', 'Toggle']),
    \ 'on_event': 'InsertEnter',
\ }) " Show the bad whitespace good boy
call dein#add('junegunn/fzf', {
    \ 'if': s:has_exec('fzf'),
    \ 'on_cmd': 'FZF',
    \ 'on_func': 'fzf#run',
\ }) " Fuzzy search yeah the clasic FZF
call dein#add('junegunn/fzf.vim', {
    \ 'depends': 'fzf',
    \ 'if': s:has_exec('fzf'),
\ }) " More FZF with turbo vim power epic!
call dein#add('mbbill/undotree', {
    \ 'if': v:version >= 700,
    \ 'on_cmd': 'UndotreeToggle',
\ }) " Undo tree be improved for the history
call dein#add('rbtnn/vim-vimscript_indentexpr', {
      \'on_ft':'vim'
      \}) " Correct indent of the beautifull vim script
call dein#add('glepnir/dashboard-nvim') " A beautiful welcome fit for kings
call dein#add('tweekmonster/startuptime.vim', {
    \ 'on_cmd': 'StartupTime',
\ }) " A ms is the live !
call dein#add('kyazdani42/nvim-tree.lua', {
    \ 'on_cmd': ['NvimTreeToggle', 'NvimTreeFindFile']
\}) " For the aesthetics tree toggle with the lua power
call dein#add('mg979/vim-visual-multi', {
    \ 'on_map': '<C-n>',
\ }) " Multiple cursors your a octoman
call dein#add('tpope/vim-vinegrar') " Delicious Salad with vinegrar
call dein#add('psliwka/vim-smoothie') " Beautifull scroll for the aesthetics

call dein#end()
