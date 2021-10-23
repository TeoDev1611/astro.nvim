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

util.set_option = function(bufnr, ...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

util.set_keymap = function(bufnr, ...)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, ..., opts)
end

return util
