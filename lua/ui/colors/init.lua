local g = vim.g
local cmd = vim.cmd
local present, nebulous = pcall(require, 'nebulous')
local present2, catppuccin = pcall(require, 'catppuccin')

if vim.fn.exists '+termguicolors' then
  vim.cmd [[
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
  ]]
end

if not present2 then
  print 'Going to the default nvim theme'
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

catppuccin.setup {
  transparent_background = false,
  term_colors = false,
  styles = {
    comments = 'italic',
    functions = 'italic',
    keywords = 'italic',
    strings = 'NONE',
    variables = 'NONE',
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = 'italic',
        hints = 'italic',
        warnings = 'italic',
        information = 'italic',
      },
      underlines = {
        errors = 'underline',
        hints = 'underline',
        warnings = 'underline',
        information = 'underline',
      },
    },
    lsp_saga = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    bufferline = true,
    ts_rainbow = true,
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
-- Ayu
g.ayucolor = 'dark'
-- Seoul
g.seoul256_background = 233
-- Vscode
g.vscode_style = 'dark'

cmd [[colo nebulous]]
