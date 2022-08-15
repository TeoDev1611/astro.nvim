-- Core Modules
local util = require 'core.util'
local logs = require 'core.logs'

-- External
local p, null_ls = pcall(require, 'null-ls')
local b = null_ls.builtins

-- Valid
if not p then
  logs:log('info', 'Not found the Null Ls Module!!!')
  return
end

-- Sources
local sources = {
  b.formatting.stylua,
  b.formatting.black,
  b.formatting.rustfmt,
  b.formatting.gofumpt,
  b.formatting.goimports,
  b.formatting.prettier,
  b.formatting.jq,
}

-- Load
vim.lsp.buf.format { timeout_ms = 2000 }
null_ls.setup {
  sources = sources,
  debug = true,
}

-- Make the command
util.command('LspFormat', vim.lsp.buf.format)
