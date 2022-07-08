local M = {}
local logs = require 'core.logs'

M.comment = function()
  local present, c = pcall(require, 'Comment')
  if not present then
    logs:logs('warn', 'Not found the Comment plugin run :PackerInstall')
    return
  end
  c.setup {
    mappings = {
      extended = true,
    },
  }
end

M.escape = function()
  local present, e = pcall(require, 'better_escape')
  if not present then
    logs:logs('warn', 'Not found the better escape plugin run :PackerInstall')
    return
  end
  e.setup {
    mapping = { 'jj', 'jk' },
    keys = '<Esc>',
    timeout = 200,
  }
end

M.autop = function()
  local present, a = pcall(require, 'nvim-autopairs')
  if not present then
    logs:logs('warn', 'Not found the autopairs plugin run :PackerInstall')
    return
  end
  a.setup {
    disable_filetype = { 'TelescopePrompt' },
    fast_wrap = {},
  }
  local status, cmp = pcall(require, 'cmp')
  if not status then
    vim.cmd [[packadd nvim-cmp]]
  end
  cmp = require 'cmp'
  local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
end

M.accelerated = function()
  vim.cmd [[
  nmap j <Plug>(accelerated_jk_gj)
  nmap k <Plug>(accelerated_jk_gk)
  ]]
end

return M
