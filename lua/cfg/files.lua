local logs = require 'core.logs'

-- The modules

local ok_tree, tree = pcall(require, 'neo-tree')
local ok_telescope, telescope = pcall(require, 'telescope')

if not ok_tree then
  logs:log('warn', 'Not found the Neotree module!!!')
  return
end

if not ok_telescope then
  logs:log('warn', 'Not found the Telescope module!!!')
  return
end

-- Tree Setup
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]
tree.setup {
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = 'rounded',
  enable_git_status = true,
  enable_diagnostics = true,
  use_default_mappings = false,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = 'ﰊ',
      default = '*',
    },
    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeModified',
    },
    name = {
      trailing_slash = true,
      use_git_status_colors = true,
    },
    git_status = {
      symbols = {
        -- Change type
        added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = '✖', -- this can only be used in the git_status source
        renamed = '', -- this can only be used in the git_status source
        -- Status type
        untracked = '?',
        ignored = '',
        unstaged = 'M',
        staged = '',
        conflict = '',
      },
    },
  },
  window = {
    position = 'left',
    width = 30,
    mappings = {
      ['<CR>'] = 'open',
      ['o'] = 'open_with_window_picker',
      ['<C-v>'] = 'vsplit_with_window_picker',
      ['<C-x>'] = 'split_with_window_picker',
      ['t'] = 'open_tabnew',
      ['T'] = 'open_tabnew',
      ['X'] = 'close_node',
      ['K'] = 'navigate_up',
      ['C'] = 'set_root',
      ['H'] = 'toggle_hidden',
      ['R'] = 'refresh',
      ['f'] = 'filter_on_submit',
      ['<c-f>'] = 'clear_filter',
      ['A'] = 'add',
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['m'] = 'move',
      ['c'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['q'] = 'close_window',
      [']c'] = 'next_git_modified',
      ['[c'] = 'prev_git_modified',
      -- reset default mappings
      ['space'] = '',
      ['<2-LeftMouse>'] = '',
      [']g'] = '',
      ['[g'] = '',
      ['S'] = '',
      ['s'] = '',
      ['<bs>'] = '',
      ['.'] = '',
      ['a'] = '',
      ['/'] = '',
    },
    mapping_options = {
      nowait = true,
    },
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = {
        '.DS_Store',
        'thumbs.db',
      },
    },
    follow_current_file = true,
    hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
  },
  buffers = {
    show_unloaded = true,
    window = {
      mappings = {
        ['bd'] = 'buffer_delete',
      },
    },
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
