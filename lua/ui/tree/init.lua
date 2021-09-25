local g = vim.g
local tree = require('nvim-tree')

tree.setup{
  auto_close = true,
  update_cwd          = false,
}

g.nvim_tree_side = 'left'
g.nvim_tree_width = 30
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', 'pack', 'extension' }
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ':t'
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_hijack_netrw = 0
g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}

vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '',
    staged = 'S',
    unmerged = '',
    renamed = '➜',
    deleted = '',
    untracked = 'U',
    ignored = '◌',
  },
  folder = {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
  },
  lsp = {
    hint = '',
    info = '',
    warning = '',
    error = '',
  },
}
