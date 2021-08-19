local opt = vim.opt
local cmd = vim.cmd

opt.syntax = 'on'
opt.syntax = 'enabled'
opt.filetype = 'plugin'
opt.filetype = 'indent'
opt.filetype = 'on'
opt.encoding = 'UTF-8'
opt.showtabline = 2
cmd 'set noshowmode'
opt.mouse = 'a'
opt.wrap = true
opt.linebreak = true
opt.cursorline = true
opt.cursorline = true
opt.relativenumber = true
opt.clipboard = 'unnamed'
opt.background = 'dark'
opt.fileencoding = 'utf-8'
opt.showcmd = true
opt.ruler = true
opt.hidden = true
opt.ignorecase = true
cmd 'set nowritebackup'

cmd [[
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
]]
