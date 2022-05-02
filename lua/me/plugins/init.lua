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

  -- Faster
  use {
    {
      'lewis6991/impatient.nvim',
      event = 'VimEnter',
      config = function()
        require 'impatient'
        require('impatient').enable_profile()
      end,
      after = 'packer.nvim',
    },
    {
      'nathom/filetype.nvim',
      event = 'VimEnter',
      config = function()
        vim.g.did_load_filetypes = 1
      end,
      after = 'packer.nvim',
    },
  }

  -- Utils
  use {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'milisims/nvim-luaref',
  }

  -- Lsp
  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
    'tamago324/nlsp-settings.nvim',
    'jose-elias-alvarez/null-ls.nvim',
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

  -- Colors
  use {
    'Mofiqul/vscode.nvim',
    'projekt0n/github-nvim-theme',
    'ackyshake/Spacegray.vim',
    'Yagua/nebulous.nvim',
    'sainnhe/gruvbox-material',
  }

  -- Syntax
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      event = 'BufRead',
      run = ':TSUpdate',
      config = function()
        require('cfg.ui').tree_sitter()
      end,
    },
    {
      'p00f/nvim-ts-rainbow',
      after = 'nvim-treesitter',
      requires = 'nvim-treesitter/nvim-treesitter',
    },
    {
      'sheerun/vim-polyglot',
      after = 'nvim-ts-rainbow',
    },
  }

  -- Better Development
  use { 'gpanders/editorconfig.nvim', 'kyazdani42/nvim-web-devicons' }

  -- Typing
  use {
    'rhysd/accelerated-jk',
    'numToStr/Comment.nvim',
    'max397574/better-escape.nvim',
    'windwp/nvim-autopairs',
    'tpope/vim-surround',
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
      event = 'BufWinEnter',
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
        { 'pwntester/octo.nvim', cmd = 'Octo' },
      },
    },
  }

  -- UI
  use {
    {
      'ray-x/lsp_signature.nvim',
      config = function()
        require('lsp_signature').setup {
          bind = true,
          fix_pos = true,
          auto_close_after = 10,
          hint_enable = true,
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
      'tamton-aquib/staline.nvim',
      event = 'BufWinEnter',
      config = function()
        require('staline').setup {}
      end,
    },
    {
      'rcarriga/nvim-notify',
      event = 'BufWinEnter',
      config = function()
        vim.notify = require 'notify'
        vim.notify.setup {
          stages = 'slide',
          timeout = 3000,
        }
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
      event = 'BufWinEnter',
      config = function()
        vim.g.highlighturl_guifg = require('me.util').get_hl('Keyword', 'fg')
        vim.g.loaded_highlighturl = 1
      end,
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      event = 'BufWinEnter',
      config = function()
        vim.opt.list = true
        vim.opt.listchars:append 'eol:↴'
        require('indent_blankline').setup {
          show_current_context = true,
          show_current_context_start = true,
        }
      end,
    },
    {
      'iamcco/markdown-preview.nvim',
      run = function ()
        vim.cmd[[call mkdp#util#install()]]
      end,
      event = 'BufWinEnter'
    }
  }
end)
