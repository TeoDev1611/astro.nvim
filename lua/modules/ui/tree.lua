setmetatable(_G, { __index = vim })

local present, tree = pcall(require, 'nvim-tree')

if not present then
  return
end

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
  update_cwd = true,
  ignore_ft_on_setup = { 'alpha', 'packer' },
  view = {
    width = 30,
    side = 'left',
  },
  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', '.cache', 'pack', 'extension' },
  },
}

g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = ':t'
g.nvim_tree_git_hl = 1

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
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
