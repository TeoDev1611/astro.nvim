local M = {}
local null_ls = require 'null-ls'

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.fixjson,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.diagnostics.vint,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.luacheck,
}

M.setup = function(on_attach)
  null_ls.config {
    debug = true,
    sources = sources,
  }

  require('lspconfig')['null_ls'].setup {
    on_attach = on_attach,
  }
end

return M
