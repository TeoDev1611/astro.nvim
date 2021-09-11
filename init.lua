require 'plugins'
require 'sets'
require 'maps'
require 'ui.colors'
local ok, buff = pcall(require, 'bufferline')
if not ok then
  return
end
buff.setup {}
