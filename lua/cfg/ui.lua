local M = {}

M.bufferline = function()
  require('bufferline').setup {}
end

------------------------------
------- Tree Sitter ----------
------------------------------

M.tree_sitter = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'lua',
      'vim',
      'markdown',
      'toml',
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
    },
  }
end

M.notify = function()
  vim.notify = require 'notify'
  vim.notify.setup {
    stages = 'slide',
    timeout = 3000,
  }
end

M.indentline = function()
  vim.opt.list = true
  vim.opt.listchars:append 'eol:↴'
  require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = true,
  }
end

M.load = function()
  M.bufferline()
  M.notify()
  M.tree_sitter()
  M.indentline()
end

return M
