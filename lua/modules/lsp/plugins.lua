local use = require('core.pack').register_plugin

use {
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
  'tamago324/nlsp-settings.nvim',
  { 'jose-elias-alvarez/null-ls.nvim', disable = true },
  {
    'L3MON4D3/LuaSnip',
    requires = {
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'uga-rosa/cmp-dictionary', after = 'nvim-cmp' },
    },
  },
}
