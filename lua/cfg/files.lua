local logs = require 'core.logs'

-- The modules
local ok_tree, tree = pcall(require, 'nvim-tree')
local ok_telescope, telescope = pcall(require, 'telescope')

if not ok_tree then
  logs:log('warn', 'Not found the Nvim tree module!!!')
  return
end

if not ok_telescope then
  logs:log('warn', 'Not found the Telescope module!!!')
  return
end

-- Tree Setup
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
  ignore_ft_on_setup = { 'alpha', 'packager' },
  filters = {
    dotfiles = false,
    custom = { '.git', 'node_modules', '.cache', 'pack', 'extension' },
  },
}

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

vim.g.nvim_tree_icons = {
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

-- Telescope Module
telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=always',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    prompt_prefix = '   ',
    selection_caret = '  ',
    entry_prefix = '  ',
    initial_mode = 'insert',
    selection_strategy = 'reset',
    sorting_strategy = 'descending',
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        prompt_position = 'top',
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    file_ignore_patterns = { 'node_modules' },
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    path_display = { 'truncate' },
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  },
}

telescope.load_extension 'fzy_native'

logs:log('info', 'Loaded successfully the Files module')
