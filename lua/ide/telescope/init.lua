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
}

telescope.load_extension 'project'

vim.cmd [[
command! -nargs=0 AstroPlugins :lua require('telescope').extensions.packer.plugins(opts)
command! -nargs=0 AstroProject :lua require'telescope'.extensions.project.project{}
]]
