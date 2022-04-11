-- Defaults
vim.g.mapleader = ' '
vim.opt.syntax = 'on'
vim.opt.syntax = 'enabled'
vim.opt.filetype = 'plugin'
vim.opt.filetype = 'indent'
vim.opt.clipboard:append 'unnamedplus'
vim.opt.filetype = 'on'
vim.opt.encoding = 'UTF-8'
vim.opt.showtabline = 2
vim.opt.laststatus = 2
vim.cmd 'set noshowmode'
vim.opt.mouse = 'a'
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.background = 'dark'
vim.opt.fileencoding = 'utf-8'
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.cmd 'set nowritebackup'

-- Add the vim_rc help better show!
vim.cmd [[
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
]]
