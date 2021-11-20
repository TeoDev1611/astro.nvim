local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
local packer = require 'packer'

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = require('util').border_thin_rounded }
    end,
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
  luarocks = {
    python_cmd = 'python -m',
  },
  config = {
    compile_path = fn.stdpath 'config' .. '/lua/packer_compiled.lua',
  },
}

local use = packer.use

return packer.startup(function()
  -- Package Managment
  use { 'wbthomason/packer.nvim' }

  use {
    'lewis6991/impatient.nvim',
    after = 'packer.nvim',
    opt = true,
    config = function()
      require 'impatient'
      require('impatient').enable_profile()
    end,
  }

  use {
    'nathom/filetype.nvim',
    after = 'impatient.nvim',
    config = function()
      vim.g.did_load_filetypes = 1
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    after = 'impatient.nvim',
    run = ':TSUpdate',
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
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require 'lsp.cmp'
    end,
    after = 'nvim-ts-rainbow',
  }

  use {
    'saadparwaiz1/cmp_luasnip',
    after = 'LuaSnip',
  }

  use {
    'hrsh7th/cmp-nvim-lua',
    after = 'cmp_luasnip',
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
    after = 'nvim-cmp',
    event = 'InsertCharPre',
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
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('ide.null-ls').setup(require('lsp.installer').on_attach())
    end,
    after = 'nvim-lsp-installer',
    disable = true,
  }

  -- IDE Tools

  use {
    'terrortylor/nvim-comment',
    config = function()
      require 'ide.comment'
    end,
    event = 'BufRead',
    after = 'nvim-lsp-installer',
  }

  use { 'tpope/vim-fugitive', cmd = { 'G' }, after = 'nvim-comment' }

  ---- Lang Configs
  use { 'editorconfig/editorconfig-vim', after = 'vim-fugitive' }
  use { 'kyazdani42/nvim-web-devicons' }

  --Colors Config
  use {
    'Yagua/nebulous.nvim',
  }

  use {
    'sainnhe/gruvbox-material',
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
    after = 'editorconfig-vim',
    event = 'BufWinEnter',
  }

  -- File Explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    event = 'BufWinEnter',
    after = 'staline.nvim',
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
    after = 'nvim-tree.lua',
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
    after = 'markdown-preview.nvim',
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
    'rhysd/accelerated-jk',
    event = 'VimEnter',
  }

  use {
    'max397574/better-escape.nvim',
    event = 'VimEnter',
    config = function()
      require('maps').setup_better_escape()
    end,
  }

  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end,
    event = 'BufWinEnter',
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
    'rust-lang/rust.vim',
    ft = { 'rust', 'toml' },
    config = function()
      require 'langs.rust'
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      vim.opt.list = true
      vim.opt.listchars:append 'space:⋅'
      vim.opt.listchars:append 'eol:↴'

      require('indent_blankline').setup {
        space_char_blankline = ' ',
        show_current_context = true,
      }
    end,
    event = 'BufRead',
  }

  use {
    'rcarriga/nvim-notify',
    event = 'BufWinEnter',
    config = function()
      vim.notify = require 'notify'
      vim.notify.setup {
        stages = 'slide',
        timeout = 7000,
      }
    end,
  }

  use {
    'neoclide/coc.nvim',
    ft = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'json' },
    branch = 'release',
    config = function()
      vim.cmd 'call astro#cocstart()'
    end,
    'github/copilot.vim',
    event = 'VimEnter',
  }

  use {
    'mhartington/formatter.nvim',
    event = 'BufRead',
    config = function()
      require('ide.formatter').setup()
    end,
  }

  use {
    'posva/vim-vue',
  }
end)
