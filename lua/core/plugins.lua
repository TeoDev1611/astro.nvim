-- Load the Runtime
local dein = require 'core.dein'
local util = require 'core.util'

-- Setup the settings!
dein.settings()

local deinPath = util.path_join(vim.g['dein#cache_directory'], 'repos', 'github.com', 'Shougo', 'dein.vim')

local runtime = string.format('set runtimepath+=%s', deinPath)

vim.cmd(runtime)

dein.setup {
  -- Manage Dein
  deinPath,
  'wsdjeg/dein-ui.vim',

  -- Faster
  { 'lewis6991/impatient.nvim' },
  { 'nathom/filetype.nvim' },

  -- Utils
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'milisims/nvim-luaref',

  -- Lsp
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  'tamago324/nlsp-settings.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'uga-rosa/cmp-dictionary',

  -- Colors
  'projekt0n/github-nvim-theme',
  'Yagua/nebulous.nvim',
  'sainnhe/gruvbox-material',

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
  'p00f/nvim-ts-rainbow', -- Better Development
  'gpanders/editorconfig.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Typing
  'rhysd/accelerated-jk',
  'numToStr/Comment.nvim',
  'max397574/better-escape.nvim',
  'windwp/nvim-autopairs',
  { 'mg979/vim-visual-multi', branch = 'master' },

  -- Git Tools
  'lewis6991/gitsigns.nvim',
  { 'lambdalisue/gina.vim', on = 'Gina' },

  -- Files Find And Search
  'ctrlpvim/ctrlp.vim',
  { 'kyazdani42/nvim-tree.lua', branch = 'nightly' },

  -- UI
  'ray-x/lsp_signature.nvim',
  'akinsho/bufferline.nvim',
  'rcarriga/nvim-notify',
  'lukas-reineke/indent-blankline.nvim',
}

dein.new_plugins()
dein.commands()
