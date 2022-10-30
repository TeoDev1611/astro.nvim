-- Utils
local logs = require 'core.logs'

-- Modules
local ok_bf, bf = pcall(require, 'bufferline')
local ok_ib, ib = pcall(require, 'indent_blankline')
local ok_tdc, tdc = pcall(require, 'todo-comments')
local ok_lualine, lualine = pcall(require, 'lualine')
local ok_notify, notify = pcall(require, 'notifier')
if not ok_bf then
  logs:log('warn', 'Not found the bufferline module!!!')
  return
end

if not ok_lualine then
  logs:log('warn', 'Not found the lualine module!!!')
  return
end

if not ok_ib then
  logs:log('warn', 'Not found the indent blankline module!!!')
  return
end

if not ok_tdc then
  logs:log('warn', 'Not found the todo comments!!!')
  return
end

if not ok_notify then
  logs:log('warn', 'Not found the notify module!!!')
  return
end

-- Setup the bufferline
bf.setup {}

-- Setup the Indent Blank Line
vim.opt.list = true
vim.opt.listchars:append 'eol:↴'

ib.setup {
  show_end_of_line = true,
}

-- Setup the Todo Comments
tdc.setup {}

-- Setup the notifications
notify.setup {}

-- Setup the line
lualine.setup {}

logs:log('info', 'Loaded successfully the UI Module')
