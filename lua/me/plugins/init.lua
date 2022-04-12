local present, packer = pcall(require, 'packer')
local setup = require 'me.plugins.setup'
local logs = require 'me.logs'

setup.setup()

if not present then
  return
end

-- Change some defaults
packer.init {
  git = {
    clone_timeout = 300, -- 5 mins
    subcommands = {
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
  use 'wbthomason/packer.nvim'

  -- Utils
  use { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'milisims/nvim-luaref' }

  -- Colors
  use {
    'Mofiqul/vscode.nvim',
    'projekt0n/github-nvim-theme',
    'ackyshake/Spacegray.vim',
    'Yagua/nebulous.nvim',
    {
      'tjdevries/gruvbuddy.nvim',
      requires = 'tjdevries/colorbuddy.vim',
    },
  }

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
    'tpope/vim-surround',
    'junegunn/vim-easy-align',
    {
      'nacro90/numb.nvim',
      config = function()
        require('numb').setup {
          show_numbers = true,
          show_cursorline = true,
          number_only = false,
          centered_peeking = true,
        }
      end,
    },
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
      'ray-x/lsp_signature.nvim',
      config = function()
        require('lsp_signature').setup {
          bind = true,
          fix_pos = false,
          auto_close_after = 15,
          hint_enable = false,
        }
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
    {
      'rcarriga/nvim-notify',
      event = 'BufWinEnter',
      config = function()
        vim.notify = require 'notify'
      end,
    },
    {
      'folke/todo-comments.nvim',
      event = 'BufWinEnter',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        if vim.g.packer_compiled_loaded then
          return
        end
        require('todo-comments').setup {
          highlight = {
            exclude = { 'org', 'orgagenda', 'vimwiki', 'markdown' },
          },
        }
      end,
    },
    {
      'itchyny/vim-highlighturl',
      config = function()
        vim.g.highlighturl_guifg = require('me.util').get_hl('Keyword', 'fg')
        vim.g.loaded_highlighturl = 1
      end,
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.opt.list = true
        vim.opt.listchars:append 'eol:↴'
        require('indent_blankline').setup {
          show_current_context = true,
          show_current_context_start = true,
        }
      end,
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

  -- Lsp
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'tamago324/nlsp-settings.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    {
      'dcampos/nvim-snippy',
      requires = {
        'honza/vim-snippets',
      },
    },
    {
      'hrsh7th/nvim-cmp',
      branch = 'dev',
      requires = {
        { 'dcampos/cmp-snippy' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
      },
    },
  }
end)
