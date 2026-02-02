return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Cargar al abrir un archivo (para que el inicio de nvim sea rápido)
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      
      if not status_ok then
        return -- Si falló, simplemente salimos y dejamos que Lazy termine de instalar
      end

      configs.setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "python",
          "rust",
          "go",
          "typescript"
        },

        -- Instalar automáticamente si abres un archivo que no está en la lista
        auto_install = true,

        -- ACTIVAR EL RESALTADO (Esto es lo que reemplaza al viejo 'syntax on')
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false, -- No usar el método viejo si Treesitter está activo
        },
        
        -- Indentación inteligente basada en la estructura del código
        indent = { enable = true },
      })
    end
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require('rainbow-delimiters.setup').setup {}
    end
  },
}
