require('numb').setup {
  show_numbers = true,
  show_cursorline = true,
  number_only = false,
  centered_peeking = true,
}

require 'cfg.tree'

require('lsp_signature').setup {
  bind = true,
  fix_pos = true,
  auto_close_after = 10,
  hint_enable = true,
}

require('cfg.ui').bufferline()

require 'cfg.eviline'

vim.notify = require 'notify'
vim.notify.setup {
  stages = 'slide',
  timeout = 3000,
}

if vim.g.packer_compiled_loaded then
  return
end
require('todo-comments').setup {
  highlight = {
    exclude = { 'org', 'orgagenda', 'vimwiki', 'markdown' },
  },
}

vim.g.highlighturl_guifg = require('me.util').get_hl('Keyword', 'fg')
vim.g.loaded_highlighturl = 1

vim.opt.list = true
vim.opt.listchars:append 'eol:↴'
require('indent_blankline').setup {
  show_current_context = true,
  show_current_context_start = true,
}

require('alpha').setup(require('alpha.themes.theta').config)
