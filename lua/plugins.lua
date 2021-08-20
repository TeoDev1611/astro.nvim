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
    threshold = 5, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
}


local use = packer.use
packer.reset()

-- Package Managment
use { 'wbthomason/packer.nvim', opt = true, event = 'VimEnter' }

-- NativeLSP
use {
  'folke/todo-comments.nvim',
  config = function()
    require 'lsp.todo-comments'
  end,
  event = 'BufWinEnter',
}
use {
  'folke/lsp-colors.nvim',
  config = function()
    require 'lsp.lsp-colors'
  end,
  event = 'BufWinEnter',
}
use {
  'neovim/nvim-lspconfig',
  config = function()
    require 'lsp.lsp-servers'
  end,
  event = 'BufReadPre',
}
use {
  'hrsh7th/nvim-compe',
  config = function()
    require 'lsp.compe'
  end,
  event = "BufReadPre"
}

use {
  'glepnir/lspsaga.nvim',
  config = function()
    require 'lsp.saga'
  end,
  cmd = 'Lspsaga',
}
use { 'hrsh7th/vim-vsnip', event = 'InsertEnter' }
use { 'rafamadriz/friendly-snippets', event = 'InsertCharPre' }

use {
  'onsails/lspkind-nvim',
  config = function()
    require 'lsp.icons'
  end,
  event = "BufReadPre"
}

-- IDE Tools
use {
  'windwp/nvim-autopairs',
  config = function()
    require 'ide.autopairs'
  end,
  event = 'InsertEnter',
  after = 'nvim-compe',
}

use {
  'terrortylor/nvim-comment',
  config = function()
    require 'ide.comment'
  end,
  event = 'BufRead',
}

use { 'tpope/vim-fugitive', cmd = { 'G' }, opt = true }

-- Lang Configs
use { 'editorconfig/editorconfig-vim' }

--Colors Config
use {
  'nvim-treesitter/nvim-treesitter',
  requires = 'p00f/nvim-ts-rainbow',
  run = ':TSUpdate',
  config = function()
    require 'ide.tree-sitter'
  end,
}
-- Colorschemes
use {
  'rafi/awesome-vim-colorschemes',
  config = function()
    require 'ui.colors'
  end,
}
use {
  'Yagua/nebulous.nvim',
  config = function()
    require 'ui.colors'
  end,
}

use {
  'JavaCafe01/javacafe.vim',
  config = function()
    require 'ui.colors'
  end,
}

-- StatusLine
use {
  'glepnir/galaxyline.nvim',
  branch = 'main',
  config = function()
    require 'ui.galaxy'
  end,
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  event = 'BufWinEnter',
}
-- File Explorer
use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  event = 'BufWinEnter',
  config = function()
    require 'ui.tree'
  end,
}

-- IDE Tools
use { 'junegunn/goyo.vim', opt = true, cmd = 'Goyo' }
use { 'iamcco/markdown-preview.nvim', opt = true, run = 'call mkdp#util#install()', ft = 'markdown' }

--Fuzzy Find
use {
  'glepnir/dashboard-nvim',
  config = function()
    vim.cmd [[let g:dashboard_default_executive = 'telescope']]
  end,
}
use {
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-packer.nvim', opt = true },
    { 'nvim-telescope/telescope-project.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
  },
  config = function()
    require 'ide.telescope'
  end,
  cmd = 'Telescope',
}
-- Jump Motions
use {
  'phaazon/hop.nvim',
  as = 'hop',
  config = function()
    require 'ide.hop'
  end,
  event = 'BufWinEnter',
}

use {
  'rhysd/accelerated-jk',
  event = 'VimEnter',
}

use {
  'akinsho/nvim-bufferline.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  event = 'BufWinEnter',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {}
  end,
}

use { 'euclidianAce/BetterLua.vim', ft = 'lua' }

use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('gitsigns').setup()
  end,
  event = "BufWinEnter"
}


use {
 "f-person/git-blame.nvim",
 config = function ()
   vim.g.gitblame_message_template = "<summary> • <date> • <author>"
 end,
 event = "BufWinEnter"
}


