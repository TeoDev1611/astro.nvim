local logs = require 'core.logs'
local present, gruvbox = pcall(require, 'gruvbox')

-- Tokyo Style vim.g.tokyonight_style = 'night'
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
if not present then
  vim.cmd [[colo iceberg]]
  logs:log('info', 'Not found the Gruvbox default theme using iceberg!')
  return
end

gruvbox.setup {
  contrast = 'hard',
}
vim.cmd [[colo aurora]]

logs:log('info', 'Loaded successfully the Colors module')
