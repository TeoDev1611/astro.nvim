require('stabline').setup {
  style = 'slant',
  bg = '#986fec',
  fg = 'black',
  stab_right = '',
}

require('staline').setup {
  defaults = {
    left_separator = '',
    right_separator = '',
    line_column = '[%l/%L] :%c 並%p%% ', -- `:h stl` to see all flags.
    fg = '#000000', -- Foreground text color.
    bg = 'none', -- Default background is transparent.
    cool_symbol = ' 異 ', -- Change this to override defult OS icon.
    full_path = false,
    font_active = 'none', -- "bold", "italic", "bold,italic", etc
    true_colors = false, -- true lsp colors.
  },
  mode_colors = {
    n = '#2bbb4f',
    i = '#986fec',
    c = '#e27d60',
    v = '#4799eb', -- etc..
  },
  mode_icons = {
    n = ' ',
    i = ' ',
    c = ' ',
    v = ' ', -- etc..
  },
  sections = {
    left = { '- ', '-mode', 'left_sep_double', ' ', 'branch' },
    mid = { 'file_name' },
    right = { 'cool_symbol', 'right_sep_double', '-line_column' },
  },
}
