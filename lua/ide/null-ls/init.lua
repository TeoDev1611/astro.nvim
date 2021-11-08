local M = {}
local null_ls = require 'null-ls'

M.sources = {
  null_ls.builtins.formatting.stylua.with {
    condition = function(utils)
      return utils.root_has_file 'stylua.toml'
    end,
  },
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.fixjson,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.diagnostics.vint,
  null_ls.builtins.diagnostics.flake8,
  null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.luacheck,
}

M.setup = function()
  null_ls.config {
    debug = true,
    sources = M.sources(),
  }
end

return M
