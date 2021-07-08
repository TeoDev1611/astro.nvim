
"------------------------------------------------------------------------------"
"                              Dein Plugin Manager                             "
"------------------------------------------------------------------------------"
if &compatible
  set nocompatible               " Be iMproved
endif

" RUNTIMEPATH FOR THE MANAGER
set runtimepath+=~\.cache\dein\repos\github.com\Shougo\dein.vim

"START LOAD PLUGIN FUNCTION
call dein#begin('~\.cache\dein')

call dein#add('Shougo/dein.vim')
call dein#add('wsdjeg/dein-ui.vim') " Dein UI
call dein#add('sainnhe/gruvbox-material') " Theme
call dein#add('jiangmiao/auto-pairs') " Close Brackets
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('neoclide/coc.nvim', { 'merged': 0 })
call dein#add('preservim/nerdcommenter')
call dein#add('marko-cerovac/material.nvim')
call dein#add('folke/which-key.nvim')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('fatih/vim-go')
call dein#add('rust-lang/rust.vim')
call dein#add('elixir-editors/vim-elixir')
call dein#add('mhinz/vim-mix-format')
call dein#add('junegunn/goyo.vim')
call dein#add('nvim-treesitter/nvim-treesitter', {'hook_post_update': 'TSUpdate'})
call dein#add('kyazdani42/nvim-web-devicons')
call dein#add('hoob3rt/lualine.nvim')
call dein#add('rktjmp/lush.nvim')
call dein#add('npxbr/gruvbox.nvim')
call dein#add('cometsong/CommentFrame.vim')
call dein#add('liuchengxu/vim-clap',  {'hook_post_update': 'Clap install-binary!'})

call dein#end()
"END LOAD PLUGIN FUNCTION
filetype plugin indent on
syntax enable
if dein#check_install()
  call dein#install()
endif

if !empty(dein#check_clean())
  call dein#recache_runtimepath()
  call map(dein#check_clean(), "delete(v:val, 'rf')")
endif



