-- Utils
local utils = require 'core.util'
local logs = require 'core.logs'

-- Modules
local ok_bf, bf = pcall(require, 'bufferline')
local ok_ib, ib = pcall(require, 'indent_blankline')
local ok_wilder, wilder = pcall(require, 'wilder')
local ok_tdc, tdc = pcall(require, 'todo-comments')

if not ok_bf then
  logs:log('warn', 'Not found the bufferline module!!!')
  return
end

if not ok_ib then
  logs:log('warn', 'Not found the indent blankline module!!!')
  return
end

if not ok_wilder then
  logs:log('warn', 'Not found the wilder module!!!')
  return
end

if not ok_tdc then
  logs:log('warn', 'Not found the todo comments!!!')
end

-- Setup the bufferline
bf.setup {}

-- Setup the Indent Blank Line
vim.opt.list = true
vim.opt.listchars:append 'eol:↴'

ib.setup {
  show_end_of_line = true,
}

-- Setup the Wilder
wilder.setup { modes = { ':', '/', '?' } }

wilder.set_option(
  'renderer',
  wilder.popupmenu_renderer {
    highlighter = wilder.basic_highlighter(),
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
  }
)

-- Setup the Todo Comments
tdc.setup {}

-- Setup the notifications
vim.notify = require 'notify'

logs:log('info', 'Loaded successfully the UI Module')
