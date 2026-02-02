return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    dependencies = {
      'williamboman/mason.nvim',
      'zapling/mason-conform.nvim', -- ¡El puente vital!
    },

    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true }
        end,
        mode = '',
        desc = 'Format buffer',
      },
    },

    config = function()
      require("mason-conform").setup({
        ignore_install = { "deno_fmt" },
      })

      require("conform").setup({
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'black', 'isort' },
          rust = { 'rustfmt' },

          -- Web / JS (Deno es rapidísimo, buena elección)
          typescript = { 'deno_fmt' },
          javascript = { 'deno_fmt' },
          markdown = { 'deno_fmt' },
          json = { 'deno_fmt' },

          toml = { 'taplo' },

          go = { 'goimports', 'gofumpt' },

          zig = { 'zigfmt' },
          yaml = { 'yamlfmt' },

          ["*"] = { "codespell" },
          ["_"] = { "trim_whitespace" },
        },

        default_format_opts = {
          lsp_format = 'fallback', -- Si no hay 'black', usa Pyright/LSP
        },

        format_on_save = {
          timeout_ms = 500, -- Si tarda más de 0.5s, no bloquea el guardado
          lsp_format = "fallback",
        },
      })

      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  }
}
