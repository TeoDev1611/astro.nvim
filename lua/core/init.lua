local pack = require 'core.pack'

pack.ensure_plugins()
require 'core.options'
require 'core.statusline'
pack.load_compile()
require 'keymaps'
