local logs = require 'core.logs'

-- Tokyo Style
vim.g.tokyonight_style = 'night'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { 'packager' }

-- Material Style
vim.g.material_style = 'deep ocean'

-- Gruvbox Style
vim.g.gruvbox_contrast_dark = 'hard'

-- Rasmus Style
vim.g.rasmus_italic_functions = true
vim.g.rasmus_bold_functions = true

-- Set the style
vim.cmd [[colo superman]]

logs:log('info', 'Loaded successfully the Colors module')
