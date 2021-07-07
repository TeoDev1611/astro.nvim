" PLUGIN MANAGER CONFIGURATIONS ( DEIN )

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
call dein#add('hoob3rt/lualine.nvim') " Status Bar
call dein#add('jiangmiao/auto-pairs') " Close Brackets
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('neoclide/coc.nvim', { 'merged': 0 })
call dein#add('preservim/nerdcommenter')
call dein#add('marko-cerovac/material.nvim')
call dein#add('folke/which-key.nvim')
call dein#add('editorconfig/editorconfig-vim')

call dein#end()
"END LOAD PLUGIN FUNCTION
filetype plugin indent on
syntax enable
if dein#check_install()
  call dein#install()
endif

