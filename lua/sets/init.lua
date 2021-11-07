local opt = vim.opt
local cmd = vim.cmd
local M = {}

opt.syntax = 'on'
opt.syntax = 'enabled'
opt.filetype = 'plugin'
opt.filetype = 'indent'
opt.clipboard:append 'unnamedplus'
opt.filetype = 'on'
opt.encoding = 'UTF-8'
opt.showtabline = 2
opt.laststatus = 2
cmd 'set noshowmode'
opt.mouse = 'a'
opt.wrap = true
opt.linebreak = true
opt.cursorline = true
opt.cursorline = true
opt.relativenumber = true
opt.background = 'dark'
opt.fileencoding = 'utf-8'
opt.showcmd = true
opt.ruler = true
opt.hidden = true
opt.ignorecase = true
opt.termguicolors = true
cmd 'set nowritebackup'

cmd [[
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
]]

-- Help :)

function M.help_lua()
  local plugin = 'AstroVim Help'

  vim.notify('For check help how use or install check the readme\n github.com/TeoDev1611/AstroVim', 'info', {
    title = plugin,
  })
end

return M
