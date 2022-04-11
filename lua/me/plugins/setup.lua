local util = require 'me.util'
local logs = require 'me.logs'
local M = {}
local download_path = util.path_join(vim.fn.stdpath 'data', 'site', 'pack', 'packer', 'start', 'packer.nvim')
local _, packer = pcall(require, 'packer')

M.setup = function()
  if vim.fn.empty(vim.fn.glob(download_path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      download_path,
    }
  end
end

util.command('Cwd', function()
  local path = vim.fn.getcwd()
  logs:log('info', string.format('The current working directory is: %s', path))
end)

return M
