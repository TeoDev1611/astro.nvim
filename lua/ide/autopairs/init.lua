local autopairs = require 'nvim-autopairs'
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'

autopairs.setup {
  disable_filetype = { 'TelescopePrompt' },
}
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
