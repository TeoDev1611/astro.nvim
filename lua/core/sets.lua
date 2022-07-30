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
vim.opt.mouse = 'a'
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.background = 'dark'
vim.opt.fileencoding = 'utf-8'
vim.opt.showcmd = true
vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.cmd 'set laststatus=3'
vim.cmd 'set cursorline'
vim.cmd 'set nowritebackup'
vim.cmd 'set noshowmode'

-- Fix the colors
vim.cmd [[
highlight WinSeparator guibg=None
]]

--- AUTOCMD
local vim_group = vim.api.nvim_create_augroup('vimrc_help', { clear = true })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.txt',
  command = [[if &buftype == 'help' | wincmd L | endif]],
  group = vim_group,
})

-- Disable Plugins

vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1
