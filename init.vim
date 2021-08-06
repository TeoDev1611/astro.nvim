" Import toml vital :p
let s:Toml = vital#_rocket#Text#TOML#import()
" Get the toml content in the dictionary
let s:TOMLContent = s:Toml.parse_file('./rocket.toml')

call pug#begin()
Pug 'kristijanhusak/vim-packager', { 'type': 'opt' }
" UTILS
Pug 'nvim-lua/popup.nvim'
Pug 'nvim-lua/plenary.nvim'
" Colors and aparience
Pug 'morhetz/gruvbox'
Pug 'blackbirdtheme/vim'
Pug 'rafi/awesome-vim-colorschemes'
" Pug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Pug 'hoob3rt/lualine.nvim'
Pug 'cocopon/iceberg.vim' 
Pug 'Yagua/nebulous.nvim'
Pug 'folke/todo-comments.nvim'
Pug 'folke/lsp-colors.nvim'
Pug 'kyazdani42/nvim-web-devicons'
" Native LSP 
Pug 'neovim/nvim-lspconfig'
Pug 'hrsh7th/nvim-compe'
Pug 'glepnir/lspsaga.nvim'
Pug 'hrsh7th/vim-vsnip'
Pug 'hrsh7th/vim-vsnip-integ'
Pug 'rafamadriz/friendly-snippets'
" IDE
Pug 'jiangmiao/auto-pairs'
Pug 'lambdalisue/gina.vim', { 'on':'Gina' }
Pug 'tpope/vim-commentary'
" FT
Pug 'vim-jp/syntax-vim-ex', {'for': 'vim'}
" Development
Pug 'vim-jp/vital.vim', { 'on':'Vitalize' }
Pug 'vim-jp/vital-complete', { 'for':'vim' }
" Telescope
Pug 'nvim-telescope/telescope.nvim', { 'type':'opt' }
" Status Line
Pug 'tjdevries/express_line.nvim'
" Fast Movements
Pug 'phaazon/hop.nvim'
Pug 'rhysd/accelerated-jk'
" Syntax
Pug 'nvim-treesitter/nvim-treesitter', { 'do':':TSUpdate' }
Pug 'p00f/nvim-ts-rainbow'
" Pug 'sheerun/vim-polyglot'
" Pug 'euclidianAce/BetterLua.vim'
call pug#end()

lua require('lsp/compe') require('lsp/lsp-servers') require('lsp/saga') require('ide/hop') require('ui/colors') require('ui/express') require('ide/telescope') require('ide/telescope')
