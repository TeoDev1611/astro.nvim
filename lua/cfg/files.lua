vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local logs = require 'core.logs'
local p_tree, tree = pcall(require, 'nvim-tree')

if not p_tree then
  logs:log('warn', 'Not found the Nvim-Tree Module!')
  return
end

tree.setup {}

logs:log('info', 'Loaded successfully the Files module')
