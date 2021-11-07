local M = {}
local null_ls = require 'null-ls'

M.setup_formatting = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.fixjson,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.rustfmt,
}

M.setup_diagnostics = {
  null_ls.builtins.diagnostics.vint,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.luacheck,
}

return M
