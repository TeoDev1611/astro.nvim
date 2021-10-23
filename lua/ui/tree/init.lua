local g = vim.g
local tree = require 'nvim-tree'

tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = 'ﯦ',
      info = '',
      warning = '',
      error = '',
    },
  },
  auto_close = true,
  update_cwd = false,
  ignore_ft_on_setup = { 'alpha' },
  view = {
    width = 30,
    side = 'left',
    auto_resize = true,
  },
}

g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'pack', 'extension' }
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ':t'

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}

g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '',
    staged = '',
    unmerged = '',
    renamed = '➜',
    deleted = '',
    untracked = '',
    ignored = '◌',
  },
  folder = {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
  },
}
