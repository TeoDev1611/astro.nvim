require 'me.plugins.setup'
-- Load the Runtime
local dein = require 'me.plugins.dein'
local util = require 'me.util'

dein.settings()

local deinPath = util.path_join(vim.g['dein#cache_directory'], 'repos', 'github.com', 'Shougo', 'dein.vim')

local runtime = string.format('set runtimepath+=%s', deinPath)

vim.cmd(runtime)

dein.setup {
  -- Manage Dein
  deinPath,
  --Langs
  { 'ray-x/go.nvim', ft = 'go' },

  -- Faster
  { 'lewis6991/impatient.nvim', event = 'VimEnter' },
  { 'nathom/filetype.nvim', event = 'VimEnter' },

  -- Utils
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'milisims/nvim-luaref',
  'ray-x/guihua.lua',

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
  'Mofiqul/vscode.nvim',
  'projekt0n/github-nvim-theme',
  'ackyshake/Spacegray.vim',
  'Yagua/nebulous.nvim',
  'sainnhe/gruvbox-material',

  -- Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
  'p00f/nvim-ts-rainbow',

  -- Better Development
  'gpanders/editorconfig.nvim',
  'kyazdani42/nvim-web-devicons',

  -- Typing
  'rhysd/accelerated-jk',
  'numToStr/Comment.nvim',
  'max397574/better-escape.nvim',
  'windwp/nvim-autopairs',
  'tpope/vim-surround',
  'nacro90/numb.nvim',
  { 'mg979/vim-visual-multi', branch = 'master' },

  -- Git Tools
  'lewis6991/gitsigns.nvim',
  { 'lambdalisue/gina.vim', on = 'Gina' },

  -- Files Find And Search
  {
    'kyazdani42/nvim-tree.lua',
    on = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
  },
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-fzy-native.nvim',

  -- UI
  'ray-x/lsp_signature.nvim',
  'akinsho/bufferline.nvim',
  'nvim-lualine/lualine.nvim',
  'rcarriga/nvim-notify',
  'folke/todo-comments.nvim',
  'itchyny/vim-highlighturl',
  'lukas-reineke/indent-blankline.nvim',
  { 'davidgranstrom/nvim-markdown-preview', cond = 'has(\'pandoc\')' },
  'goolord/alpha-nvim',
}

dein.new_plugins()
