local config = {}

function config.gruvbox()
  vim.g.gruvbox_contrast_dark = 'hard'
  vim.g.gruvbox_italicize_strings = 1
end

function config.github()
  require('github-theme').setup {
    theme_style = 'dark_default',
    function_style = 'italic',
    sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' },
  }
end

function config.spacegray()
  vim.g.spacegray_use_italics = 1
  vim.g.spacegray_underline_search = 1
end

function config.nebulous()
  require('nebulous').setup {
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
end

function config.bufferline()
  require('bufferline').setup {
    options = {
      modified_icon = '✥',
      buffer_close_icon = '',
      always_show_bufferline = false,
    },
  }
end

function config.tree()
  require 'modules.ui.tree'
end

function config.notify()
  vim.notify = require 'notify'
  vim.notify.setup {
    stages = 'slide',
    timeout = 3000,
  }
end

function config.url()
  vim.g.highlighturl_guifg = require('core.utils').get_hl('Keyword', 'fg')
  vim.g.loaded_highlighturl = 1
end

function config.treesitter()
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

return config
