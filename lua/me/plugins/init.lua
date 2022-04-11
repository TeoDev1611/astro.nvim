local present, packer = pcall(require, 'packer')
local setup = require 'me.plugins.setup'

setup.setup()

if not present then
  return
end

-- Change some defaults
packer.init {
  git = {
    clone_timeout = 300, -- 5 mins
    subcommands = {
      -- Prevent packer from downloading all branches metadata to reduce cloning cost
      -- for heavy size plugins like plenary (removed the '--no-single-branch' git flag)
      install = 'clone --depth %i --progress',
    },
  },
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
  profile = {
    enable = true,
  },
}

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  -- Plugins manager
  use {
    'wbthomason/packer.nvim',
  }

  -- Utils
  use { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }

  -- Colors
  use { 'Mofiqul/vscode.nvim', 'projekt0n/github-nvim-theme', 'ackyshake/Spacegray.vim' }

  -- Syntax
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    },
    {
      'p00f/nvim-ts-rainbow',
      requires = 'nvim-treesitter/nvim-treesitter',
    },
  }

  -- Better Development
  use { 'gpanders/editorconfig.nvim', 'kyazdani42/nvim-web-devicons', { 'sbdchd/neoformat', cmd = 'Neoformat' } }

  -- Typing
  use {
    'rhysd/accelerated-jk',
    'numToStr/Comment.nvim',
    'max397574/better-escape.nvim',
    'windwp/nvim-autopairs',
    { 'mg979/vim-visual-multi', branch = 'master' },
  }

  -- Git Tools
  use {
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end,
    },
    { 'lambdalisue/gina.vim', cmd = 'Gina' },
  }

  -- Files Find And Search
  use {
    {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require 'cfg.tree'
      end,
      cmd = {
        'NvimTreeClipboard',
        'NvimTreeClose',
        'NvimTreeFindFile',
        'NvimTreeOpen',
        'NvimTreeRefresh',
        'NvimTreeToggle',
      },
    },
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-telescope/telescope-fzy-native.nvim',
        'chip/telescope-software-licenses.nvim',
        'pwntester/octo.nvim',
      },
    },
  }

  -- UI
  use {
    {
      'Pocco81/TrueZen.nvim',
      event = 'BufWinEnter',
    },
    {
      'wfxr/minimap.vim',
      cmd = {
        'Minimap',
        'MinimapClose',
        'MinimapToggle',
        'MinimapRefresh',
        'MinimapUpdateHighlight',
      },
      run = function()
        logs:log('warn', 'Dont forget install the code-minimap package from cargo for use this!')
      end,
    },
    {
      'akinsho/bufferline.nvim',
      event = 'BufWinEnter',
      config = function()
        require('cfg.ui').bufferline()
      end,
    },
    {
      'nvim-lualine/lualine.nvim',
      event = 'BufWinEnter',
      config = function()
        require('cfg.ui').lualine()
      end,
    },
    {
      'mhinz/vim-startify',
      event = 'VimEnter',
    },
  }

  -- Faster
  use {
    {
      'lewis6991/impatient.nvim',
      event = 'VimEnter',
      config = function()
        require 'impatient'
      end,
    },
    {
      'nathom/filetype.nvim',
      event = 'VimEnter',
      config = function()
        vim.g.did_load_filetypes = 1
      end,
    },
  }
end)
