return {
  -----------------------------------------------------------------------------
  -- 1. MARKDOWN PREVIEW (Peek)
  -----------------------------------------------------------------------------
  {
    'toppair/peek.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    build = 'deno task --quiet build:fast',
    keys = {
      {
        '<leader>op',
        function()
          local peek = require 'peek'
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        desc = 'Peek (Markdown Preview)',
      },
    },
    opts = {
      theme = 'dark',
      app = 'browser', -- Abre en tu navegador por defecto
    },
  },

  -----------------------------------------------------------------------------
  -- 2. GIT SIGNS (Indicadores visuals en la columna izquierda)
  -----------------------------------------------------------------------------
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      -- Muestra una línea fantasma con el author del último cambio (Blame)
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 500, -- Espera medio segundo para mostrarlo
        virt_text_pos = 'eol', -- Muestra el texto al final de la línea
      },
      -- Atajos rápidos para navegar entre cambios
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navegar entre cambios (hunks)
        map('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true })

        -- Acciones básicas
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'Git Stage Hunk' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'Git Reset Hunk' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Git Preview Hunk' })
        map('n', '<leader>hb', function()
          gs.blame_line { full = true }
        end, { desc = 'Git Blame Line' })
      end,
    },
  },

  -----------------------------------------------------------------------------
  -- 3. GIT UI (Reemplazo moderno de Gina)
  -- Abre una terminal flotante con LazyGit. Es mucho más potente.
  -----------------------------------------------------------------------------
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit (Git UI)' },
    },
  },
}
