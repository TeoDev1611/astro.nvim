local alpha = require 'alpha'
local startify = require 'alpha.themes.startify'
startify.section.header.val ={
  [[ _______  _______  _______  ______    _______  __   __  ___   __   __ ]],
  [[|   _   ||       ||       ||    _ |  |       ||  | |  ||   | |  |_|  |]],
  [[|  |_|  ||  _____||_     _||   | ||  |   _   ||  |_|  ||   | |       |]],
  [[|       || |_____   |   |  |   |_||_ |  | |  ||       ||   | |       |]],
  [[|       ||_____  |  |   |  |    __  ||  |_|  ||       ||   | |       |]],
  [[|   _   | _____| |  |   |  |   |  | ||       | |     | |   | | ||_|| |]],
  [[|__| |__||_______|  |___|  |___|  |_||_______|  |___|  |___| |_|   |_|]]
}
startify.section.footer = {
  { type = "text", val = "AstroVim - Teo" }
}

alpha.setup(startify.opts)

