--[[ local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
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
  autotag = {
    enable = true,
  },
}
]]
vim.cmd [[
let g:rbpt_colorpairs = [
    \ ['brown',       'Gold'],
    \ ['Darkblue',    'Orchid'],
    \ ['darkgray',    'LightSkyBlue'],
    \ ['darkgreen',   'Gold'],
    \ ['darkcyan',    'Orchid'],
    \ ['darkred',     'LightSkyBlue'],
    \ ['darkmagenta', 'Gold'],
    \ ['brown',       'Orchid'],
    \ ['gray',        'LightSkyBlue'],
    \ ['black',       'Gold'],
    \ ['darkmagenta', 'Orchid'],
    \ ['Darkblue',    'LightSkyBlue'],
    \ ['darkgreen',   'Gold'],
    \ ['darkcyan',    'Orchid'],
    \ ['darkred',     'LightSkyBlue'],
    \ ['red',         'Gold'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
]]
require('core.logs'):log('info', 'Loaded successfully the Syntax module')
