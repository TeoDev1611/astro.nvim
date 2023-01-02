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
  packager.add 'bluz71/vim-moonfly-colors'
  packager.add 'rafalbromirski/vim-aurora'
  packager.add 'cocopon/iceberg.vim'
  packager.add 'folke/lsp-colors.nvim'
  -- Faster
  packager.add 'nathom/filetype.nvim'
  packager.add 'lewis6991/impatient.nvim'

  -- Syntax
  -- Remove TreeSitter temporaly for bugs
  packager.add('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
  packager.add 'p00f/nvim-ts-rainbow'

  -- Editor Support
  packager.add 'gpanders/editorconfig.nvim'
  packager.add 'kyazdani42/nvim-web-devicons'
  -- Utils
  packager.add 'nvim-lua/plenary.nvim'

  -- Apparience Tools ---
  -- Comments
  packager.add 'folke/todo-comments.nvim'
  -- Tabline
  packager.add 'akinsho/bufferline.nvim'
  -- Indent Line
  packager.add 'lukas-reineke/indent-blankline.nvim'
  -- Notifications
  packager.add 'vigoux/notifier.nvim'
  -- Statusline Statusline
  packager.add 'nvim-lualine/lualine.nvim'

  -- File Search ---
  packager.add('nvim-tree/nvim-tree.lua', { requires = 'nvim-tree/nvim-web-devicons', tag = 'nightly' })
  if string.lower(vim.loop.os_uname().sysname) == 'windows' then
    packager.add 'nvim-telescope/telescope.nvim'
  else
    packager.add 'ibhagwan/fzf-lua'
    packager.add('junegunn/fzf', {
      ['do'] = function()
        vim.fn['fzf#install']()
      end,
    })
  end
  -- Lsp Helper
  packager.add 'neovim/nvim-lspconfig'
  -- Installer
  packager.add('williamboman/mason.nvim', { requires = 'williamboman/mason-lspconfig.nvim' })
  -- Snippet
  packager.add('L3MON4D3/LuaSnip', { requires = 'rafamadriz/friendly-snippets' })
  -- Lsp Settings Manager
  packager.add 'folke/neoconf.nvim'
  -- Formatter
  packager.add 'jose-elias-alvarez/null-ls.nvim'
  -- Quick Fix
  packager.add 'folke/trouble.nvim'
  -- Lsp UI Helper
  packager.add 'glepnir/lspsaga.nvim'
  packager.add 'lewis6991/hover.nvim'
  -- Engine
  packager.add('hrsh7th/nvim-cmp', {
    requires = {
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
    },
  })

  -- Typing setup
  packager.add 'rhysd/accelerated-jk'
  packager.add 'numToStr/Comment.nvim'
  packager.add 'max397574/better-escape.nvim'
  packager.add 'windwp/nvim-autopairs'
  packager.add('mg979/vim-visual-multi', { branch = 'master' })

  -- Languages setup
  packager.add('TeoDev1611/venom.nvim', { ft = 'python' })
  packager.add('iamcco/markdown-preview.nvim', {
    ['do'] = function()
      vim.fn['mkdp#util#install']()
    end,
  })
  -- Git Setup
  packager.add 'lewis6991/gitsigns.nvim'
  packager.add 'lambdalisue/gina.vim'
end, {
  dir = util.path_join(vim.fn.stdpath 'data', 'site', 'pack', 'packager'),
})
