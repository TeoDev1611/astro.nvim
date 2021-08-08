

" Get the path of the rocket.toml
if has('win32')
  let s:path = expand('~/AppData/Local/nvim/rocket.toml')
elseif has('linux') || has('mac')
  let s:path = expand('~/.config/nvim/rocket.toml')
endif

" Import toml vital :p
let s:Toml = vital#_rocket#Text#TOML#import()
" Get the toml content in the dictionary
let s:TOMLContent = s:Toml.parse_file(s:path)

" ------------------------------- UTILS 


" Get the conf key
let s:conf_data = s:TOMLContent.conf

" Check if option exists
function! s:check_key(key)abort
  if has_key(s:conf_data, a:key)
    return s:conf_data
  else
    return ''
  endif
endfunction

" ------------------------------ End UTILS


call pug#begin()

" TODO: Fix the lua loading for best usage

Pug 'kristijanhusak/vim-packager', { 'type': 'opt' }
" UTILS
if !empty(s:check_key('utils'))
  Pug 'nvim-lua/popup.nvim'
  Pug 'kyazdani42/nvim-web-devicons'
  Pug 'nvim-lua/plenary.nvim'
endif
" Colors and aparience
if !empty(s:check_key('colorschemes'))
  Pug 'morhetz/gruvbox'
  Pug 'blackbirdtheme/vim'
  Pug 'rafi/awesome-vim-colorschemes'
  Pug 'cocopon/iceberg.vim' 
  Pug 'Yagua/nebulous.nvim'
  lua require('ui/colors')
endif
" Status Line not lazy Loading for best work 
" TODO: Fix the bug into the load
Pug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
lua require('ui/galaxy')
if !empty(s:check_key('lsp'))
  Pug 'folke/todo-comments.nvim'
  Pug 'folke/lsp-colors.nvim'
  Pug 'neovim/nvim-lspconfig'
  Pug 'hrsh7th/nvim-compe'
  Pug 'glepnir/lspsaga.nvim'
  Pug 'hrsh7th/vim-vsnip'
  Pug 'hrsh7th/vim-vsnip-integ'
  Pug 'rafamadriz/friendly-snippets'
  lua require('lsp/compe') require('lsp/lsp-servers') require('lsp/saga')
endif

if !empty(s:check_key('ide_tools'))
  Pug 'jiangmiao/auto-pairs'
  Pug 'lambdalisue/gina.vim', { 'on':'Gina' }
  Pug 'tpope/vim-commentary'
endif

if !empty(s:check_key('vim_dev'))
  Pug 'vim-jp/vital.vim', { 'on':'Vitalize' }
  Pug 'vim-jp/vital-complete', { 'for':'vim' }
endif

if !empty(s:check_key('telescope'))
  Pug 'nvim-telescope/telescope.nvim', { 'type':'opt' }
  lua require('ide/telescope')
endif

if !empty(s:check_key('fast_movements'))
    Pug 'phaazon/hop.nvim'
    lua require('ide/hop')
    Pug 'rhysd/accelerated-jk'
endif

if !empty(s:check_key('tree_sitter'))
  Pug 'nvim-treesitter/nvim-treesitter', { 'do':':TSUpdate' }
  Pug 'p00f/nvim-ts-rainbow'
  " HACK: Uncomment if you use
  " lua require('ide/tree_sitter')
endif

if !empty(s:check_key('polygot'))
  Pug 'sheerun/vim-polyglot'
  Pug 'euclidianAce/BetterLua.vim'
endif
call pug#end()

