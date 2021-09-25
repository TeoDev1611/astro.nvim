local util = {}

util.get_separator = function()
  if util.is_windows then
    return '\\'
  end
  return '/'
end

util.join_paths = function(...)
  local separator = util.get_separator()
  return table.concat({ ... }, separator)
end

return util
