local use = require('core.pack').register_plugin
local conf = require 'modules.lsp.config'

use {
  { 'neovim/nvim-lspconfig', config = conf.lspconfig },
  { 'williamboman/nvim-lsp-installer', config = conf.installer },
  { 'tamago324/nlsp-settings.nvim', config = conf.nlspsettings },
  { 'jose-elias-alvarez/null-ls.nvim', disable = true },
  {
    'hrsh7th/nvim-cmp',
    event = 'BufReadPre',
    config = conf.cmp,
    requires = {
      { 'saadparwaiz1/cmp_luasnip', after = 'LuaSnip' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-lspconfig' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    event = 'InsertCharPre',
    config = conf.luasnip,
    requires = {
      'rafamadriz/friendly-snippets',
    },
  },
  {
    'ray-x/lsp_signature.nvim',
    config = conf.lspsignature,
  },
}
