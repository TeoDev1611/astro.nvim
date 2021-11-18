local g = vim.g
local cmd = vim.cmd
local present, nebulous = pcall(require, 'nebulous')

if vim.fn.exists '+termguicolors' then
  vim.cmd [[
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  ]]
end

if not present then
  cmd [[colo evening]]
  return
end

--Put this lines inside your vimrc to set the colorscheme
nebulous.setup {
  variant = 'night',
  disable = {
    background = true,
    endOfBuffer = false,
  },
  italic = {
    comments = true,
    keywords = true,
    functions = true,
    variables = false,
  },
  custom_colors = { -- this table can hold any group of colors with their respective values
    LineNr = { fg = '#5BBBDA', bg = 'NONE', style = 'NONE' },
    CursorLineNr = { fg = '#E1CD6C', bg = 'NONE', style = 'NONE' },

    -- it is possible to specify only the element to be changed
    TelescopePreviewBorder = { fg = '#A13413' },
    LspDiagnosticsDefaultError = { bg = '#E11313' },
    TSTagDelimiter = { style = 'bold,italic' },
  },
}

-- Gruvbox
g.gruvbox_contrast_dark = 'hard'
g.gruvbox_material_pate = 'original'
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

cmd [[colo gruvbox-material]]
