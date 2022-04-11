local M = {}

M.bufferline = function()
  require('bufferline').setup {}
end

------------------------------
------- Tree Sitter ----------
------------------------------

M.tree_sitter = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = {
      'lua',
      'vim',
      'markdown',
      'toml',
    },
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
    },
  }
end

M.lualine = function()
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
      },
      lualine_b = { 'filename', 'branch' },
      lualine_c = { 'fileformat' },
      lualine_x = { 'g:coc_status' },
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = { 'nvim-tree' },
  }
end

return M
