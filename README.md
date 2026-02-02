# 🚀 Astro.nvim - Ejemplo de Configuración Moderna

Bienvenido a **Astro.nvim**, un ejemplo de configuración de Neovim moderna, modular y ultrarrápida. Este proyecto está diseñado para ofrecer una experiencia similar a un IDE pero manteniendo la ligereza y extensibilidad de Neovim.

## ✨ Características Principales

- 📦 **Gestor de Plugins:** [Lazy.nvim](https://github.com/folke/lazy.nvim) para una carga diferida y eficiente.
- 🎨 **Interfaz Estética:**
  - Tema **Tokyonight-night** para una experiencia visual relajante.
  - Barra de estado con **Lualine**.
  - Pestañas modernas con **Bufferline**.
  - Notificaciones elegantes con **nvim-notify**.
  - Pantalla de inicio personalizada con **Dashboard-nvim**.
- 🔍 **Navegación:**
  - Explorador de archivos **Neo-tree**.
  - Búsqueda difusa (Fuzzy finding) con **Telescope**.
- 🛠️ **Desarrollo (LSP & Tooling):**
  - Autocompletado de última generación con **Blink.cmp**.
  - Configuración automática de LSP con **Mason** y **nvim-lspconfig**.
  - Formateo de código al guardar con **Conform.nvim**.
  - Resaltado de sintaxis superior con **Treesitter**.

## 📂 Estructura de Archivos

La configuración está organizada de forma modular para facilitar su mantenimiento:

```text
~/.config/nvim/
├── init.lua              # Punto de entrada, opciones de Vim y Atajos generales
└── lua/
    ├── lazy.lua          # Configuración del gestor de plugins (opcional)
    └── plugins/          # Directorio de plugins modulares
        ├── blink.lua      # Autocompletado y snippets
        ├── colors.lua     # Temas y colores
        ├── diagnostics.lua# Interfaz de errores y advertencias
        ├── files.lua      # Neo-tree y Telescope (Navegación)
        ├── fmt.lua        # Formateo (Conform.nvim)
        ├── latex.lua      # Configuración específica para LaTeX
        ├── lsp.lua        # Servidores de lenguaje (LSP) y Mason
        ├── tools.lua      # Utilidades extra
        ├── treesitter.lua # Resaltado de sintaxis y Rainbow delimiters
        ├── typing.lua     # Mejoras al escribir (autopairs, etc)
        └── ui.lua         # Componentes visuales (Lualine, Notify, etc)
```

## ⌨️ Atajos de Teclado Principales

La tecla `Leader` está configurada como el **Espacio** (` `).

### Generales
- `<leader>w`: Guardar archivo.
- `<leader>q`: Salir de Neovim.
- `<Esc>`: Limpiar resaltado de búsqueda.

### Navegación
- `<leader>n`: Alternar explorador de archivos (Neo-tree).
- `<leader>ff`: Buscar archivos (Telescope).
- `<leader>fw`: Buscar texto en el proyecto (Grep).
- `<TAB>` / `<S-TAB>`: Cambiar entre buffers (pestañas).
- `<leader>x`: Cerrar buffer actual.

### LSP y Formateo
- `gd`: Ir a definición.
- `gr`: Ver referencias.
- `K`: Ver documentación (Hover).
- `<leader>R`: Renombrar símbolo.
- `<leader>f`: Formatear buffer manualmente.

## 🛠️ Instalación

1. Asegúrate de tener instalado **Neovim 0.10+**.
2. Clona este repositorio en tu carpeta de configuración:
   ```bash
   git clone <url-del-repo> ~/.config/nvim
   ```
3. Abre Neovim y espera a que `Lazy.nvim` instale todos los plugins automáticamente.

## ⚙️ Requisitos
- **Nerd Fonts:** Necesario para ver los iconos correctamente (ej. JetBrainsMono Nerd Font).
- **Herramientas de compilación:** `gcc`, `make`, `unzip` (para Treesitter y Mason).
- **Ripgrep:** Necesario para las búsquedas de Telescope (`live_grep`).

---
Hecho con ❤️ para la comunidad de Neovim.
