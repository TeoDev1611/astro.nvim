local open = io.open
local util = {}
local levels = vim.log.levels

if jit ~= nil then
  util.is_windows = jit.os == 'Windows'
else
  util.is_windows = package.config:sub(1, 1) == '\\'
end

util.get_separator = function()
  if util.is_windows then
    return '\\'
  end
  return '/'
end

util.path_join = function(...)
  local separator = util.get_separator()
  return table.concat({ ... }, separator)
end

util.set_option = function(bufnr, ...)
  vim.api.nvim_buf_set_option(bufnr, ...)
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

util.read_file = function(path)
  local file = open(path, 'rb') -- r read mode and b binary mode
  if not file then
    return nil
  end
  local content = file:read '*a'
  file:close()
  return content
end

util.notify = function(msg, lvl)
  vim.notify(msg, lvl, {
    title = 'Astro.nvim',
  })
end

util.file_exists = function(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

util._fns = {}
local function fn_to_cmd(fn)
  if type(fn) ~= 'function' then
    return fn
  end
  table.insert(util._fns, fn)
  return ('lua require\'core.utils\'._fns[%d]()'):format(#util._fns)
end

local keymap_defaults = {
  mode = 'n',
  opts = {
    noremap = true,
    silent = true,
  },
}

local function _keymap(tbl, cfg, keys)
  for k, v in pairs(tbl) do
    local lhs = (keys or '') .. k
    local rhs = type(v) == 'function' and ('<cmd>%s<cr>'):format(fn_to_cmd(v)) or v
    for mode in cfg.mode:gmatch '.' do
      if cfg.buffer then
        vim.api.nvim_buf_set_keymap(cfg.buffer, mode, lhs, rhs, cfg.opts)
      else
        vim.api.nvim_set_keymap(mode, lhs, rhs, cfg.opts)
      end
    end
  end
end

util.command = function(name, rhs, attributes)
  local attrs = {}
  if attributes then
    for k, v in pairs(attributes) do
      table.insert(attrs, ('-%s=%s'):format(k, v))
    end
  end
  vim.cmd(table.concat(vim.tbl_flatten { 'silent command!', attrs, name, fn_to_cmd(rhs) }, ' '))
end

util.keymap = function(t1, t2)
  if not t2 then
    _keymap(t1, keymap_defaults)
  else
    _keymap(t2, vim.tbl_deep_extend('force', keymap_defaults, t1))
  end
end

local function get_hl(group_name)
  local ok, hl = pcall(vim.api.nvim_get_hl_by_name, group_name, true)
  if ok then
    hl.foreground = hl.foreground and '#' .. bit.tohex(hl.foreground, 6)
    hl.background = hl.background and '#' .. bit.tohex(hl.background, 6)
    hl[true] = nil -- BUG: API returns a true key which errors during the merge
    return hl
  end
  return {}
end

util.get_hl = function(group, attribute, fallback)
  if not group then
    vim.notify('Cannot get a highlight without specifying a group', levels.ERROR)
    return 'NONE'
  end
  local hl = get_hl(group)
  attribute = ({ fg = 'foreground', bg = 'background' })[attribute] or attribute
  local color = hl[attribute] or fallback
  if not color then
    vim.schedule(function()
      vim.notify(fmt('%s %s does not exist', group, attribute), levels.INFO)
    end)
    return 'NONE'
  end
  -- convert the decimal RGBA value from the hl by name to a 6 character hex + padding if needed
  return color
end

util.get_plugins_list = function()
  local logger = require 'core.logs'
  local list = {}
  local tmp = vim.split(
    vim.fn.globpath(util.path_join(vim.fn.stdpath 'config', 'lua', 'modules'), '*/plugins.lua'),
    '\n'
  )
  for _, f in ipairs(tmp) do
    list[#list + 1] = string.match(f, util.path_join('lua', '(.+).lua$'))
  end
  logger:log('info', list)
  logger:log('info', tmp)
end
return util
