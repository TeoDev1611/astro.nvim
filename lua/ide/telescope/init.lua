vim.cmd 'packadd telescope.nvim'
vim.cmd 'packadd telescope-packer.nvim'
vim.cmd 'packadd telescope-project.nvim'
vim.cmd 'packadd telescope-fzy-native.nvim'

local telescope = require 'telescope'
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
    selection_caret = '  ',
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
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

telescope.load_extension 'project'
telescope.load_extension 'fzy_native'

vim.cmd [[
command! -nargs=0 ListPlugins :lua require('telescope').extensions.packer.plugins(opts)
command! -nargs=0 Project :lua require'telescope'.extensions.project.project{}
]]
