local lspconfig = require("lspconfig")
lspconfig.vimls.setup({})
lspconfig.gopls.setup({})
lspconfig.tsserver.setup({})
lspconfig.rls.setup({})
-- lspconfig.diagnosticls.setup{}
lspconfig.jsonls.setup({
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
      end,
    },
  },
})
