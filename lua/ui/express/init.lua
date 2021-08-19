local generator = function()
  local el_segments = {}

  local extensions = require 'el.extensions'
  table.insert(el_segments, extensions.mode) -- mode returns the current mode.

  table.insert(el_segments, '   ')

  local file_namer = function(_window, buffer)
    return buffer.name
  end
  table.insert(el_segments, file_namer)

  local file_type = function()
    local ft = vim.bo.filetype
    return '                                                                                             [ '
      .. ft
      .. ' ]   '
  end

  table.insert(el_segments, file_type)

  return el_segments
end

-- And then when you're all done, just call
require('el').setup { generator = generator }
