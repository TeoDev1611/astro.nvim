# 🚀 Astro.nvim - Configuración Moderna de Neovim

Bienvenido a **Astro.nvim**, una configuración de Neovim moderna, modular y optimizada para el rendimiento. Diseñada para proporcionar una experiencia similar a un IDE con la velocidad y eficiencia de Vim.

## ✨ Características Principales

*   ⚡ **Gestor de Plugins:** [Lazy.nvim](https://github.com/folke/lazy.nvim) para una carga rápida y diferida.
*   🎨 **Interfaz Visual:**
    *   Tema **Ayu Dark** por defecto (con opciones como Tokyonight, Gruvbox, Moonbow).
    *   Barra de estado global con **Lualine**.
    *   Pestañas de buffer con **Bufferline**.
    *   Pantalla de inicio personalizada con **Alpha-nvim**.
    *   Iconos con **Mini.icons**.
    *   Guías de indentación con **Indent Blankline**.
*   🔍 **Navegación:**
    *   Explorador de archivos **Neo-tree**.
    *   Búsqueda potente con **Telescope** (archivos, texto, diagnósticos).
*   🧠 **Inteligencia de Código (LSP):**
    *   Instalación automática de servidores con **Mason** y **Lspconfig**.
    *   Autocompletado ultrarrápido con **Blink.cmp**.
    *   Diagnósticos en línea modernos con **Tiny Inline Diagnostic**.
    *   Soporte para **LaTeX** con **VimTex**.
*   🛠️ **Herramientas de Edición:**
    *   Formateo automático con **Conform.nvim**.
    *   Resaltado de sintaxis avanzado con **Treesitter** y **Rainbow Delimiters**.
    *   Gestión de Git con **LazyGit** y **Gitsigns**.
    *   Vista previa de Markdown en tiempo real con **Peek**.
    *   Utilidades de edición: **Autopairs**, **Surround**, **Better Escape**, **Accelerated-JK**.

## ⚙️ Requisitos Previos

Asegúrate de tener instalado lo siguiente antes de comenzar:

*   **Neovim** (v0.10 o superior).
*   **Nerd Font** (ej. JetBrainsMono Nerd Font) para los iconos.
*   **Git** para clonar el repositorio y gestionar plugins.
*   **Ripgrep** (`rg`) para las búsquedas de texto en Telescope.
*   **Compiladores:** `gcc`, `make`, `unzip` (necesarios para Treesitter y Mason).
*   **Node.js / NPM** (opcional, para algunos servidores de lenguaje y herramientas).

## 📥 Instalación

1.  Haz una copia de seguridad de tu configuración actual (si tienes una):
    ```bash
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    ```

2.  Clona este repositorio:
    ```bash
    git clone <URL_DEL_REPOSITORIO> ~/.config/nvim
    ```

3.  Inicia Neovim:
    ```bash
    nvim
    ```
    *Lazy.nvim comenzará a instalar y configurar los plugins automáticamente. Espera a que termine.*

## ⌨️ Atajos de Teclado (Cheat Sheet)

La tecla líder (`<leader>`) está configurada como **Espacio**.

### 🛠️ General
| Atajo | Acción |
| :--- | :--- |
| `<leader>q` | Salir de Neovim |
| `<C-s>` | Guardar archivo (Normal e Insertar) |
| `<Esc>` | Limpiar resaltado de búsqueda |
| `<leader>w` | (Si configurado) Guardar archivo |

### 🪟 Ventanas y Pestañas
| Atajo | Acción |
| :--- | :--- |
| `<leader>sv` | Dividir ventana verticalmente |
| `<leader>sh` | Dividir ventana horizontalmente |
| `<C-h/j/k/l>` | Moverse entre ventanas |
| `<C-Arrows>` | Redimensionar ventanas |
| `<TAB>` | Siguiente Buffer (Pestaña) |
| `<S-TAB>` | Buffer Anterior |
| `<leader>x` | Cerrar Buffer actual |

### 📂 Navegación de Archivos
| Atajo | Acción |
| :--- | :--- |
| `<leader>n` | Abrir/Cerrar Explorador (Neo-tree) |
| `<leader>e` | Revelar archivo actual en Explorador |
| `<leader>ff` | Buscar archivos (Telescope) |
| `<leader>fw` | Buscar texto/palabra (Grep) |
| `<leader>fb` | Listar buffers abiertos |
| `<leader>fd` | Ver diagnósticos del proyecto |

### 🧠 LSP y Código
| Atajo | Acción |
| :--- | :--- |
| `gd` | Ir a Definición |
| `gr` | Ver Referencias |
| `K` | Ver Documentación (Hover) |
| `<leader>R` | Renombrar símbolo |
| `<leader>f` | Formatear archivo (Conform) |
| `<leader>th` | Alternar Inlay Hints (si disponible) |
| `<leader>xx` | Ver lista de diagnósticos (Trouble) |
| `<leader>xt` | Ver lista de TODOs (Todo-Trouble) |

### ✨ Autocompletado (Blink.cmp)
| Atajo | Acción |
| :--- | :--- |
| `<C-space>` | Mostrar documentación / Completar |
| `<CR>` | Aceptar sugerencia |
| `<Up>/<Down>` | Seleccionar anterior/siguiente |
| `<C-b>/<C-f>` | Desplazar documentación |

### 🌳 Git
| Atajo | Acción |
| :--- | :--- |
| `<leader>gg` | Abrir **LazyGit** (Interfaz completa) |
| `]c` / `[c` | Ir al siguiente/anterior cambio (Hunk) |
| `<leader>hs` | Stage Hunk (preparar cambio) |
| `<leader>hr` | Reset Hunk (deshacer cambio) |
| `<leader>hp` | Previsualizar Hunk |
| `<leader>hb` | Ver Blame de la línea |

### 📝 Edición y Varios
| Atajo | Acción |
| :--- | :--- |
| `gc` (vis) | Comentar selección |
| `gcc` | Comentar línea |
| `<leader>op` | Vista previa de Markdown (Peek) |
| `jk` / `jj` | Salir del modo Insertar (Better Escape) |
| `ys...` | Añadir envoltorio (Surround) |
| `ds...` | Borrar envoltorio (Surround) |
| `cs...` | Cambiar envoltorio (Surround) |

## 📂 Estructura del Proyecto

```text
~/.config/nvim/
├── init.lua              # Configuración base, mapeos y bootstrap de Lazy
├── .editorconfig         # Configuración de estilo de código
├── .stylua.toml          # Configuración de formateo para Lua
├── lazy-lock.json        # Snapshot de versiones de plugins
├── after/
│   └── treesitter.lua    # Configuración de post-carga para Treesitter
├── lua/
│   ├── lazy.lua          # Archivo de soporte (vacío actualmente)
│   └── plugins/          # Configuración modular de plugins
│       ├── blink.lua      # Autocompletado (Blink.cmp)
│       ├── colors.lua     # Temas (Ayu, TokyoNight, etc.)
│       ├── diagnostics.lua# Diagnósticos modernos (Tiny Inline)
│       ├── files.lua      # Navegación y búsqueda (Neo-tree, Telescope)
│       ├── fmt.lua        # Formateo automático (Conform)
│       ├── latex.lua      # Soporte para LaTeX (VimTex)
│       ├── lsp.lua        # Configuración LSP (Mason, Lspconfig)
│       ├── tools.lua      # Utilidades (Git, Markdown Peek, etc.)
│       ├── treesitter.lua # Resaltado de sintaxis y Rainbow Delimiters
│       ├── typing.lua     # Edición (Autopairs, Surround, Comentarios)
│       └── ui.lua         # Interfaz (Lualine, Bufferline, Alpha, Notify)
```

---
> **Nota:** Esta configuración está viva. Si encuentras algún problema, revisa los archivos en `lua/plugins/` para ajustar el comportamiento a tu gusto.
