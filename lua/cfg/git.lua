local logs = require 'core.logs'

local p, gitsigns = pcall(require, 'gitsigns')

if not p then
  logs:log('warn', 'Not found the GitSigns module!')
  return
end

gitsigns.setup {}
