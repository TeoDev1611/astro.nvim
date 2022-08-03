vim.cmd [[packadd vim-packager]]

-- Require the modules
local ok, packager_start = pcall(require, 'packager')
local logs = require 'core.logs'
local util = require 'core.util'

if not ok then
  logs:log('info', 'Not found the Packager Plugin Manager')
  return
end
packager_start.setup(function(packager)
  -- Package Manager
  packager.add('kristijanhusak/vim-packager', { type = 'opt' })

  -- Colorschemes
  packager.add 'folke/tokyonight.nvim'
  packager.add 'LunarVim/Colorschemes'
  packager.add 'marko-cerovac/material.nvim'

  -- Faster
  packager.add 'nathom/filetype.nvim'
  packager.add 'lewis6991/impatient.nvim'

  -- Syntax
  packager.add('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
  packager.add 'windwp/nvim-ts-autotag'
  packager.add 'p00f/nvim-ts-rainbow'

  -- Editor Support
  packager.add 'gpanders/editorconfig.nvim'
  packager.add 'kyazdani42/nvim-web-devicons'
  -- Utils
  packager.add 'nvim-lua/plenary.nvim'

  -- Apparience Tools ---

  -- The Menu Apparience
  packager.add 'gelguy/wilder.nvim'
  -- Comments
  packager.add 'folke/todo-comments.nvim'
  -- Tabline
  packager.add 'akinsho/bufferline.nvim'
  -- Indent Line
  packager.add 'lukas-reineke/indent-blankline.nvim'
  -- Notifications
  packager.add 'rcarriga/nvim-notify'
  -- Statusline Statusline
  packager.add 'tjdevries/express_line.nvim'
  -- Start Page
  packager.add 'goolord/alpha-nvim'

  -- File Search ---
  vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
  packager.add('nvim-neo-tree/neo-tree.nvim', {
    branch = 'v2.x',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
  })
  packager.add('nvim-telescope/telescope.nvim', {
    requires = {
      'nvim-telescope/telescope-fzy-native.nvim',
    },
  })

  -- Lsp Setup ---

  -- Lsp Helper
  packager.add 'neovim/nvim-lspconfig'
  -- Installer
  packager.add('williamboman/mason.nvim', { requires = 'williamboman/mason-lspconfig.nvim' })
  -- Snippet
  packager.add('L3MON4D3/LuaSnip', { requires = 'rafamadriz/friendly-snippets' })
  -- Lsp Settings Manager
  packager.add 'tamago324/nlsp-settings.nvim'
  -- Formatter
  packager.add 'jose-elias-alvarez/null-ls.nvim'
  -- Quick Fix
  packager.add 'folke/trouble.nvim'
  -- Lsp UI Helper
  packager.add 'ray-x/lsp_signature.nvim'

  -- Engine
  packager.add('hrsh7th/nvim-cmp', {
    requires = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'uga-rosa/cmp-dictionary',
    },
  })

  -- Typing setup
  packager.add 'rhysd/accelerated-jk'
  packager.add 'numToStr/Comment.nvim'
  packager.add 'max397574/better-escape.nvim'
  packager.add 'windwp/nvim-autopairs'
  packager.add('mg979/vim-visual-multi', { branch = 'master' })

  -- Languages setup
  packager.add('simrat39/rust-tools.nvim', { ft = 'rust' })

  -- Git Setup
  packager.add 'TimUntersberger/neogit'
  packager.add 'lewis6991/gitsigns.nvim'
end, {
  dir = util.path_join(vim.fn.stdpath 'data', 'site', 'pack', 'packager'),
})
