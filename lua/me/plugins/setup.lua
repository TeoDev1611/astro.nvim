local util = require 'me.util'
local logs = require 'me.logs'

util.command('Cwd', function()
  local path = vim.fn.getcwd()
  logs:log('info', string.format('The current working directory is: %s', path))
end)

util.command('DeinInstall', function()
  require('me.plugins.dein').install()
end)

util.command('DeinUpdate', function()
  require('me.plugins.dein').update()
end)

util.command('DeinReInstall', function()
  require('me.plugins.dein').reinstall()
end)

util.command('DeinRemotePlugins', function()
  require('me.plugins.dein').remote_plugins()
end)
