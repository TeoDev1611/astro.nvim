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

util.mapper = function(mode, key, action, Opts)
  if type(mode) ~= 'string' then
    vim.notify('error', 'AstroVim the mode is a string')
  end
  if type(key) ~= 'string' then
    vim.notify('error', 'AstroVim the key is necessary a string')
  end

  if type(action) ~= 'string' then
    vim.notify('error', 'AstroVim action is necessary a string')
  end

  Opts = { silent = true }

  vim.api.nvim_set_keymap(mode, key, action, Opts)
end

util.border_thin_rounded = {
  '╭',
  '─',
  '╮',
  '│',
  '╯',
  '─',
  '╰',
  '│',
}

return util
