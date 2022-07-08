local plugin = require('core.pack').register_plugin
local conf = require 'modules.ui.config'

plugin { 'gruvbox-community/gruvbox', config = conf.gruvbox }

plugin {
  'projekt0n/github-nvim-theme',
  config = conf.github,
}

plugin {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = conf.treesitter,
}

plugin {
  'p00f/nvim-ts-rainbow',
  after = 'nvim-treesitter',
  requires = 'nvim-treesitter/nvim-treesitter',
}

plugin { 'ackyshake/Spacegray.vim', config = conf.spacegray }

plugin { 'Yagua/nebulous.nvim', config = conf.nebulous }

plugin { 'akinsho/bufferline.nvim', config = conf.bufferline, requires = 'kyazdani42/nvim-web-devicons' }

plugin { 'rcarriga/nvim-notify', config = conf.notify }

plugin {
  'kyazdani42/nvim-tree.lua',
  config = conf.tree,
  cmd = 'NvimTreeToggle',
  requires = 'kyazdani42/nvim-web-devicons',
}

plugin {
  'itchyny/vim-highlighturl',
  config = conf.url,
}
