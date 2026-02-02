return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", 
    priority = 1000, 
    config = function()
      require('tiny-inline-diagnostic').setup({
        preset = "modern", -- Opciones: "modern", "classic", "minimal", "powerline"
        
        -- Opciones visuales
        options = {
          show_source = true, -- Muestra de dónde viene el error (ej: Pyright)
          use_icons_from_diagnostic = true, -- Usa los iconos que configuramos en lsp.lua
          
          -- Si el mensaje es muy largo, lo corta para que no moleste
          overflow = {
            mode = "wrap", 
          },
        },
      })
      vim.diagnostic.config({ virtual_text = false }) 
    end
  }
}
