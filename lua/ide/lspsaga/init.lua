local M = {}
local map = vim.api.nvim_buf_set_keymap
local lspsaga = require 'lspsaga'

local function setup_lspsaga_opts()
  lspsaga.setup { -- defaults ...
    debug = false,
    use_saga_diagnostic_sign = true,
    -- diagnostic sign
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    diagnostic_header_icon = '   ',
    -- code action title icon
    code_action_icon = ' ',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 40,
      virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 10,
    finder_action_keys = {
      open = 'o',
      vsplit = 's',
      split = 'i',
      quit = 'q',
      scroll_down = '<C-f>',
      scroll_up = '<C-b>',
    },
    code_action_keys = {
      quit = 'q',
      exec = '<CR>',
    },
    rename_action_keys = {
      quit = '<C-c>',
      exec = '<CR>',
    },
    definition_preview_icon = '  ',
    border_style = 'single',
    rename_prompt_prefix = '➤',
    server_filetype_map = {},
    diagnostic_prefix_format = '%d. ',
  }
end

local function setup_lspsaga_maps()
  --- In lsp attach function
  map(0, 'n', 'gr', '<cmd>Lspsaga rename<cr>', { silent = true, noremap = true })
  map(0, 'n', 'gx', '<cmd>Lspsaga code_action<cr>', { silent = true, noremap = true })
  map(0, 'x', 'gx', ':<c-u>Lspsaga range_code_action<cr>', { silent = true, noremap = true })
  map(0, 'n', 'K', '<cmd>Lspsaga hover_doc<cr>', { silent = true, noremap = true })
  map(0, 'n', 'go', '<cmd>Lspsaga show_line_diagnostics<cr>', { silent = true, noremap = true })
  map(0, 'n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', { silent = true, noremap = true })
  map(0, 'n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', { silent = true, noremap = true })
  map(0, 'n', '<C-u>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<cr>')
  map(0, 'n', '<C-d>', '<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<cr>')
end

M.setup_lspsaga_help = function()
  local text = [[
  astro.nvim:

  Hey! If you need help this config use this plugin:

  The original version is unmantained: https://github.com/tami5/lspsaga.nvim
  ]]

  vim.notify(text, 'info')
end

M.setup = function()
  setup_lspsaga_opts()
  setup_lspsaga_maps()
  vim.cmd 'command! LspsagaHelp require("ide.lspsaga").setup_lspsaga_help()'
end

return M
