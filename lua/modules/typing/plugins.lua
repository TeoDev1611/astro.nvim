local use = require('core.pack').register_plugin
local conf = require 'modules.typing.config'

use {
  { 'rhysd/accelerated-jk', config = conf.accelerated },
  { 'numToStr/Comment.nvim', config = conf.comment },
  { 'max397574/better-escape.nvim', config = conf.escape },
  { 'windwp/nvim-autopairs', config = conf.autop },
  {
    'nacro90/numb.nvim',
    config = conf.numb,
  },
  { 'mg979/vim-visual-multi', branch = 'master' },
}
