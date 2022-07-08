local plugin = require('core.pack').register_plugin
local conf = require 'modules.fuzzy.config'

plugin {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    { 'nvim-lua/popup.nvim', opt = true },
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
  },
}

plugin {
  'ctrlpvim/ctrlp.vim',
  config = conf.ctrlp,
}
