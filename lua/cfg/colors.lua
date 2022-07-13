local p, github = pcall(require, 'github-theme')
local p2, nebulous = pcall(require, 'nebulous')
local logs = require 'core.logs'

if not p then
  logs:log('warn', 'Not found the github theme!')
  return
end

if not p2 then
  logs:log('warn', 'Not found the nebulous theme!')
  return
end

-- Github
github.setup {
  theme_style = 'dark',
  function_style = 'italic',
  sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
}

-- Nebulous
nebulous.setup {
  variant = 'night',
  disable = {
    background = false,
    endOfBuffer = true,
    terminal_colors = false,
  },
  italic = {
    comments = true,
    keywords = false,
    functions = true,
    variables = false,
  },
  custom_colors = {
    WinSeparator = { bg = 'None' },
  },
}

-- Gruvbox
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_cursor = 'orange'
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_palette = 'original'

vim.cmd [[colo github_dark_default]]
