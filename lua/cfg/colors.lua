-- Tokyo Style

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { 'packager' }

-- Material Style
vim.g.material_style = 'deep ocean'

-- Gruvbox Style
vim.g.gruvbox_contrast_dark = 'hard'

-- Transparent
require('transparent').setup {
  extra_groups = {
    'BufferLineTabClose',
    'BufferlineBufferSelected',
    'BufferLineFill',
    'BufferLineBackground',
    'BufferLineSeparator',
    'BufferLineIndicatorSelected',
    'ElPrompt',
    'ElSLine',
    'Statusline',
  },
  exclude = {}, -- table: groups you don't want to clear
}

-- Set the style
vim.cmd [[colo moonfly]]

require('core.logs'):log('info', 'Loaded successfully the Colors module')
