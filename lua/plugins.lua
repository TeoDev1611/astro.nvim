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
  'lewis6991/impatient.nvim',
  rocks = 'mpack',
  opt = true,
  config = function()
    require 'impatient'
  end,
}

use {
  'folke/todo-comments.nvim',
  config = function()
    require 'lsp.todo-comments'
  end,
  event = 'BufWinEnter',
  after = 'impatient.nvim',
}

use {
  'neovim/nvim-lspconfig',
  'williamboman/nvim-lsp-installer',
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
    { 'hrsh7th/cmp-path' },
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

-- IDE Tools

use {
  'terrortylor/nvim-comment',
  config = function()
    require 'ide.comment'
  end,
  event = 'BufRead',
  keys = { { 'n', 'gc' }, { 'n', 'gcc' } },
}

use { 'tpope/vim-fugitive', cmd = { 'G' }, opt = true }

-- Lang Configs
use { 'editorconfig/editorconfig-vim' }
use { 'kyazdani42/nvim-web-devicons' }

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
  'gruvbox-community/gruvbox',
  requires = {
    { 'Yagua/nebulous.nvim' },
    { 'ayu-theme/ayu-vim' },
    { 'folke/tokyonight.nvim' },
    { 'Pocco81/Catppuccino.nvim' },
    { 'pineapplegiant/spaceduck' },
  },
  config = function()
    require 'ui.colors'
  end,
}

use {
  'shadmansaleh/lualine.nvim',
  config = function()
    require 'ui.lualine'
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
  run = 'cd app && yarn install',
  ft = 'markdown',
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle', 'MarkdownPreviewStop' },
}

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
  event = 'BufWinEnter',
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup {}
  end,
}

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
      buftype_exclude = { 'dashboard' },
    }
  end,
}
