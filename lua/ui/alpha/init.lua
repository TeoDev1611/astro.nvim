local header = [[

 _______  _______  _______  ______    _______  __   __  ___   __   __ 
|   _   ||       ||       ||    _ |  |       ||  | |  ||   | |  |_|  |
|  |_|  ||  _____||_     _||   | ||  |   _   ||  |_|  ||   | |       |
|       || |_____   |   |  |   |_||_ |  | |  ||       ||   | |       |
|       ||_____  |  |   |  |    __  ||  |_|  ||       ||   | |       |
|   _   | _____| |  |   |  |   |  | ||       | |     | |   | | ||_|| |
|__| |__||_______|  |___|  |___|  |_||_______|  |___|  |___| |_|   |_|

]]

local alpha = require'alpha'
local startify = require'alpha.themes.startify'
startify.section.header.val = header
alpha.setup(startify.opts)

vim.cmd[[
  autocmd FileType alpha set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
]]
