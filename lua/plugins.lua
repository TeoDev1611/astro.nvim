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
  'neovim/nvim-lspconfig',
  config = function()
    require 'lsp.lsp-servers'
  end,
  event = 'BufReadPre',
}

use {
  'hrsh7th/nvim-cmp',
  config = function()
    require 'lsp.cmp'
  end,
  requires = {
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'saadparwaiz1/cmp_luasnip' },
  },
}

use {
  'windwp/nvim-autopairs',
  config = function()
    require 'ide.autopairs'
  end,
  after = 'nvim-cmp',
}

use {
  'glepnir/lspsaga.nvim',
  config = function()
    require 'lsp.saga'
  end,
  cmd = 'Lspsaga',
}
use { 'L3MON4D3/LuaSnip' }
use { 'rafamadriz/friendly-snippets', event = 'InsertCharPre' }

use {
  'onsails/lspkind-nvim',
  config = function()
    require 'lsp.icons'
  end,
}

-- IDE Tools

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
use { 'iamcco/markdown-preview.nvim', opt = true, run = 'cd app && yarn install', ft = 'markdown' }

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
  'f-person/git-blame.nvim',
  config = function()
    vim.g.gitblame_message_template = '<summary> • <date> • <author>'
  end,
  event = 'BufWinEnter',
}

use {
  'ray-x/go.nvim',
  ft = { 'go', 'gomod' },
  config = function()
    require('go').setup {
      goimport = 'gopls', -- if set to 'gopls' will use golsp format
      gofmt = 'gopls', -- if set to gopls will use golsp format
      max_line_len = 120,
      tag_transform = false,
      test_dir = '',
      comment_placeholder = '   ',
      lsp_cfg = false, -- false: use your own lspconfig
      lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
      lsp_on_attach = false, -- use on_attach from go.nvim
      dap_debug = false,
    }
    vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)
    vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
  end,
}

use {
  'akinsho/nvim-toggleterm.lua',
  config = function()
    require('toggleterm').setup {
      shade_terminals = false,
    }
    vim.g.toggleterm_terminal_mapping = '<C-t>'
  end,
}
