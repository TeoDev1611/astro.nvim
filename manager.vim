
"------------------------------------------------------------------------------"
"                              Dein Plugin Manager                             "
"------------------------------------------------------------------------------"

"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
"                               Utils for manager                              "
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

function! s:prefix(str, args) abort
    return map(a:args, {_, s -> a:str . s})
endfunction

function! s:suffix(str, args) abort
    return map(a:args, {_, s -> s . a:str})
endfunction

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
      \}) " Dein UI
call dein#add('sainnhe/gruvbox-material') " Theme
call dein#add('jiangmiao/auto-pairs', {
  \ 'on_event': 'InsertEnter',
  \}) " Close Brackets
call dein#add('tpope/vim-fugitive', {
    \ 'if': s:has_exec('git'),
\ })
call dein#add('neoclide/coc.nvim', { 
      \'merged': 0,
      \  'if':  s:has_exec('node') && s:has_exec('git'),
      \})
call dein#add('tpope/vim-commentary', {
    \ 'on_cmd': 'Commentary',
    \ 'on_map': 'gc',
\ })
call dein#add('marko-cerovac/material.nvim')
call dein#add('folke/which-key.nvim', {
      \ 'on_cmd':'WhichKey',
      \})
call dein#add('editorconfig/editorconfig-vim', {
    \ 'if': has('pythonx'),
    \ 'on_event': 'InsertEnter',
    \ 'on_path': '.editorconfig',
\ })
call dein#add('fatih/vim-go', {
      \  'on_ft': 'go',
      \  'if': s:has_exec('go') && s:has_exec('git'),
      \})
call dein#add('rust-lang/rust.vim', {
      \  'on_ft': 'rust',
      \  'if': s:has_exec('rustc') &&  s:has_exec('cargo') && s:has_exec('git'),
      \})
call dein#add('elixir-editors/vim-elixir', {
      \  'on_ft': 'elixir',
      \   'if': s:has_exec('mix') && s:has_exec('elixir') && s:has_exec('git'),
      \})
call dein#add('mhinz/vim-mix-format', {
      \  'on_ft': 'elixir',
      \   'if': s:has_exec('mix') && s:has_exec('elixir') && s:has_exec('git'),
      \})
call dein#add('junegunn/goyo.vim', {
      \ 'on_cmd':  'Goyo',
      \})
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('hoob3rt/lualine.nvim')
call dein#add('rktjmp/lush.nvim')
call dein#add('npxbr/gruvbox.nvim')
call dein#add('cometsong/CommentFrame.vim', {
        \'on_cmd': s:prefix('Comment', ['FrameSlashes','FrameSlashStar', 'FrameHashDash', 'FrameHashEqual',  'FrameQuoteDash', 'FrameQuoteTilde'])
	\})
call dein#add('RRethy/vim-illuminate')
call dein#add('airblade/vim-gitgutter', {
    \ 'if': has('signs') && s:has_exec('git'),
\ })
call dein#add('ambv/black', {
    \ 'if': v:version >= 704 && has('python3') && s:has_exec('black'),
    \ 'on_cmd': 'Black',
    \ 'on_ft': 'python',
\ })
call dein#add('bitc/vim-bad-whitespace', {
    \ 'on_cmd': s:suffix('BadWhitespace', ['Erase', 'Hide', 'Toggle']),
    \ 'on_event': 'InsertEnter',
\ })


call dein#end()
