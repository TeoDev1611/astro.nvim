local logs = require 'core.logs'

-- External modules
local ok_gitsigns, gitsigns = pcall(require, 'gitsigns')
local ok_neogit, neogit = pcall(require, 'neogit')

if not ok_gitsigns then
  logs:log('warn', 'Not found the GitSigns module!!!!')
  return
end

if not ok_neogit then
  logs:log('warn', 'Not found the Neogit module!!!!!')
  return
end

gitsigns.setup {}
neogit.setup {}
