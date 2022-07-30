-- Tokyo Style

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { 'packager' }

-- Material Style
vim.g.material_style = 'deep ocean'

-- Set the style
vim.cmd [[colo material]]

require('core.logs'):log('info', 'Loaded successfully the Colors module')
