call plugpac#begin()
" Plugin Manager
Pack 'k-takata/minpac', {'type': 'opt'}
" UTILS
Pack 'nvim-lua/popup.nvim'
Pack 'nvim-lua/plenary.nvim'
" Colors and aparience
Pack 'morhetz/gruvbox'
Pack 'folke/todo-comments.nvim'
Pack 'folke/lsp-colors.nvim'
Pack 'kyazdani42/nvim-web-devicons'
" Native LSP 
Pack 'neovim/nvim-lspconfig'
Pack 'hrsh7th/nvim-compe'
Pack 'glepnir/lspsaga.nvim'
Pack 'hrsh7th/vim-vsnip'
Pack 'rafamadriz/friendly-snippets'
" IDE
Pack 'jiangmiao/auto-pairs'
Pack 'lambdalisue/gina.vim', { 'on':'Gina' }
Pack 'tpope/vim-commentary'
" FT
Pack 'vim-jp/syntax-vim-ex', {'for': 'vim'}
" Development
Pack 'vim-jp/vital.vim', { 'on':'Vitalize' }
" Telescope
Pack 'nvim-telescope/telescope.nvim', { 'on':'Telescope' }
" Status Line
Pack 'hoob3rt/lualine.nvim'
" Fast Movements
Pack 'phaazon/hop.nvim'
Pack 'rhysd/accelerated-jk'
" Syntax
Pack 'nvim-treesitter/nvim-treesitter', { 'do':':TSUpdate' }
Pack 'p00f/nvim-ts-rainbow'
call plugpac#end()

lua require('lsp/compe') require('lsp/lsp-servers') require('lsp/saga') require('ui/statusline') require('ide/hop') require('ide/tree-sitter')

