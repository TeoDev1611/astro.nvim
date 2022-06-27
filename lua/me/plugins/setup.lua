local util = require 'me.util'
local logs = require 'me.logs'
local M = {}
local jetpack_path = util.path_join(vim.fn.stdpath 'data', 'site', 'autoload', 'jetpack.vim')

M.upgrade = function()
  if vim.fn.executable 'curl' == 1 then
    logs:log('info', 'Found the CURL executable and going to the installation')
    vim.fn.system {
      'curl',
      '-fLo',
      jetpack_path,
      '--create-dirs',
      'https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim',
    }
    logs:log('info', 'Installed successfully the JetPack plugin manager!!')
  else
    logs:log('error', 'Not found the CURL and this is necessary install this now!!!!!')
  end
end

M.install = function()
  if util.file_exists(jetpack_path) == false then
    M.upgrade()
  else
    logs:log('warn', 'Found an installation of jetpack do you want update run JetpackUpgrade')
  end
end

util.command('Cwd', function()
  local path = vim.fn.getcwd()
  logs:log('info', string.format('The current working directory is: %s', path))
end)

util.command('DeinInstall', function()
  require('me.plugins.dein').install()
end)

util.command('JetpackUpgrade', function()
  M.upgrade()
end)

return M
