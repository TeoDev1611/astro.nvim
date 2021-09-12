local g = vim.g
local cmd = vim.cmd

if vim.fn.exists '+termguicolors' then
  vim.cmd [[
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  ]]
end

-- Options of the colorschemes
g.nb_disable_background = false
g.nb_italic_comments = true
g.nb_italic_keywords = true
g.nb_italic_functions = true
g.nb_italic_variables = false
g.nb_style = 'night'
-- Setup the lua colorshemes
--nebulous.setup()
-- Gruvbox
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_material_pate = 'mix'
g.gruvbox_material_cursor = 'orange'
g.gruvbox_material_background = 'hard'
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_material_diagnostic_text_highlight = 1
g.gruvbox_material_better_performance = 1
-- Material
g.material_style = 'deep ocean'
g.material_italic_comments = true
g.material_italic_keywords = true
g.material_italic_functions = true
-- Embark
g.embark_terminal_italics = 1
--  Amora
g.mode = 'mirtilo'
-- Ayu
g.ayucolor = 'dark'
-- Seoul
g.seoul256_background = 233
-- Rose Pine
g.rose_pine_variant = 'moon'
-- Vscode
g.vscode_style = 'dark'

cmd [[colo uwu]]
