vim.cmd [[packadd packer.nvim]]
local packer = require 'packer'

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
    prompt_border = 'single',
  },
  git = {
    clone_timeout = 600, -- Timeout, in seconds, for git clones
  },
  auto_clean = true,
  compile_on_sync = true,
  profile = {
    enable = true,
    threshold = 1,
  },
}

local use = packer.use
packer.reset()

-- Package Managment
use { 'wbthomason/packer.nvim', opt = true, event = 'VimEnter' }

use {
  'nvim-treesitter/nvim-treesitter',
  after = 'packer.nvim',
  run = ':TSUpdate',
  branch = '0.5-compat',
  event = 'BufRead',
  config = function()
    require 'ide.tree-sitter'
  end,
}

use {
  'p00f/nvim-ts-rainbow',
  after = 'nvim-treesitter',
}

use {
  'rafamadriz/friendly-snippets',
  event = 'InsertEnter',
}

use {
  'hrsh7th/vim-vsnip',
  after = 'friendly-snippets'
}

use {
  'hrsh7th/nvim-cmp',
  after = 'vim-vsnip',
  config = function()
    require 'lsp.cmp'
  end,
}

use {
  'hrsh7th/cmp-vsnip',
  after = 'vim-vsnip',
}

use {
  'hrsh7th/cmp-nvim-lua',
  after = 'cmp-vsnip',
}

use {
  'hrsh7th/cmp-nvim-lsp',
  after = 'cmp-nvim-lua',
}

use {
  'hrsh7th/cmp-buffer',
  after = 'cmp-nvim-lsp',
}

use {
  'hrsh7th/cmp-path',
  after = 'cmp-nvim-lsp',
}

use {
  'windwp/nvim-autopairs',
  config = function()
    require 'ide.autopairs'
  end,
  event = 'InsertCharPre',
  after = 'nvim-cmp',
}

use {
  'neovim/nvim-lspconfig',
  after = 'cmp-nvim-lsp',
}
use {
  'williamboman/nvim-lsp-installer',
  config = function()
    require('lsp.installer').setup()
  end,
  after = 'nvim-lspconfig',
}

use {
  'glepnir/lspsaga.nvim',
  config = function()
    require 'lsp.saga'
  end,
  cmd = 'Lspsaga',
  after = 'nvim-lsp-installer',
}

-- IDE Tools

use {
  'terrortylor/nvim-comment',
  config = function()
    require 'ide.comment'
  end,
  event = 'BufRead',
  after = 'lspsaga.nvim',
}

use { 'tpope/vim-fugitive', cmd = { 'G' }, opt = true }

-- Lang Configs
use { 'editorconfig/editorconfig-vim' }
use { 'kyazdani42/nvim-web-devicons' }

--Colors Config
use {
  'Yagua/nebulous.nvim',
}

use {
  'tjdevries/colorbuddy.vim',
  'tjdevries/gruvbuddy.nvim',
}

use {
  'pineapplegiant/spaceduck',
}

use {
  'Pocco81/Catppuccino.nvim',
}

use {
  'tamton-aquib/staline.nvim',
  config = function()
    require 'ui.staline'
  end,
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
}

-- File Explorer
use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  event = 'BufWinEnter',
  config = function()
    require 'ui.tree'
  end,
  cmd = {
    'NvimTreeOpen',
    'NvimTreeClose',
    'NvimTreeToggle',
    'NvimTreeFocus',
    'NvimTreeRefresh',
    'NvimTreeClipboard',
    'NvimTreeFindFile',
    'NvimTreeResize',
  },
}
-- IDE Tools
use {
  'iamcco/markdown-preview.nvim',
  opt = true,
  ft = 'markdown',
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle', 'MarkdownPreviewStop' },
}

--Fuzzy Find

use {
  'goolord/alpha-nvim',
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require 'ui.alpha'
  end,
  event = 'VimEnter',
}

use {
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-packer.nvim', opt = true },
    { 'nvim-telescope/telescope-project.nvim', opt = true },
  },
  config = function()
    require 'ide.telescope'
  end,
  cmd = 'Telescope',
  event = 'BufWinEnter',
}
-- Jump Motions
use {
  'phaazon/hop.nvim',
  as = 'hop',
  config = function()
    require 'ide.hop'
  end,
  cmd = { 'HopWord', 'HopLine', 'HopChar1', 'HopChar2', 'HopPattern', '' },
}

use {
  'rhysd/accelerated-jk',
  event = 'VimEnter',
}

use {
  'akinsho/nvim-bufferline.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  config = function()
    require('bufferline').setup {}
  end,
}

use {
  'f-person/git-blame.nvim',
  config = function()
    vim.g.gitblame_message_template = '<summary> • <date> • <author>'
  end,
  event = 'BufRead',
}

use {
  'ray-x/go.nvim',
  ft = { 'go', 'gomod' },
  config = function()
    require 'langs.go'
  end,
}

use {
  'akinsho/nvim-toggleterm.lua',
  config = function()
    require('toggleterm').setup {
      shade_terminals = true,
    }
    vim.g.toggleterm_terminal_mapping = '<C-t>'
  end,
  cmd = { 'ToggleTerm', 'ToggleTermCloseAll', 'ToggleTermOpenAll' },
}

use {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    vim.opt.listchars = {
      space = '|',
      eol = '↴',
    }

    require('indent_blankline').setup {
      show_end_of_line = true,
      space_char_blankline = ' ',
      buftype_exclude = { 'alpha' },
    }
  end,
  event = 'BufRead',
}

use {
  'rcarriga/nvim-notify',
}

use {
  'tweekmonster/startuptime.vim',
  cmd = 'StartupTime'
}
