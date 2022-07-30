-- Core Modules
local logs = require 'core.logs'

-- External
local p4, signature = pcall(require, 'lsp_signature')
local p5, trouble = pcall(require, 'trouble')
local p6, nlspsettings = pcall(require, 'nlspsettings')

if not p4 then
  logs:log('warn', 'Not found the Lsp Signature Module!')
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

-- Modules worker
signature.setup {}
trouble.setup {}
nlspsettings.setup {}
