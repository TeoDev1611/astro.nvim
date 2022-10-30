local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
local logs = require 'core.logs'

if not ok then
  logs:log('warn', 'Not found the treesitter module')
  return
end

treesitter.setup {
  ensure_installed = {
    'lua',
    'vim',
    'markdown',
    'toml',
  },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
  },
}

require('core.logs'):log('info', 'Loaded successfully the Syntax module')
