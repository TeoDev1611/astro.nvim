-- Core Modules
local logs = require 'core.logs'

-- External
local p4, hover = pcall(require, 'hover')
local p5, trouble = pcall(require, 'trouble')
local p6, nlspsettings = pcall(require, 'nlspsettings')
local p7, lspsaga = pcall(require, 'lspsaga')

if not p4 then
  logs:log('warn', 'Not found the Hover Module!')
  return
end

if not p5 then
  logs:log('warn', 'Not found the Trouble module!')
  return
end

if not p6 then
  logs:log('warn', 'Not found the Nlspsettings module')
  return
end

if not p7 then
  logs:log('warn', 'Not found the LspSaga module!')
  return
end

-- Modules worker
hover.setup {
  init = function()
    require 'hover.providers.lsp'
    require 'hover.providers.gh'
  end,
}
lspsaga.init_lsp_saga {
  symbol_in_winbar = {
    in_custom = true,
  },
}
trouble.setup {}
nlspsettings.setup {}
