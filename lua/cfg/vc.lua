local logs = require 'core.logs'

-- External modules
local ok_gitsigns, gitsigns = pcall(require, 'gitsigns')

if not ok_gitsigns then
  logs:log('warn', 'Not found the GitSigns module!!!!')
  return
end

gitsigns.setup {}
