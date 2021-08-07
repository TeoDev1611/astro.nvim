<div align="center">
  
  # :rocket: RocketVim
  
  <q>Blazing faster neovim configuration made for a IDE use with Vim</q>

  [![Powered by vital.vim](https://img.shields.io/badge/powered%20by-vital.vim-80273f.svg)](https://github.com/vim-jp/vital.vim)

</div>

## Commands, Maps and Plugins

> Note is current not updated 

- **Intelljsense** [NativeLSP](https://github.com/neovim/nvim-lspconfig) you can select this in the manager settings for lua native lsp [here](https://github.com/TeoDev1611/RocketVim/blob/rocket/lua/lsp/lsp-servers/init.lua) 

- **Comments** The comment tool what use is [vim-commentary](https://github.com/tpope/vim-commentary) this can be activate with gcc and gc can you see the documentation for this amazing tool in the repository all settings are the default.

- **Pairs** For the pairs in the brackets i use [autopairs](https://github.com/steelsojka/pears.nvim)

- **Languages Supported** Any question how setup a language can you open a issue for help you :v:
  - Rust
  - Go
  - Elixir
  - HTML
  - CSS
  - Python
  - Java
  - JavaScript
  - EditorConfig **This not a language only a tool :smiley:**
  - Json, Toml, Yaml
  - Lua

- **File Explorer** I use the awesome asynchronus file explorer [Fern](https://github.com/lambdalisue/fern.vim) you can open this with ``<leader>n`` into the left side and ``<C-m>`` into the full screen

- **Fuzzy Search** I dont use the clasic *FZF* in this case i use **Telescope** for open this  you can use ````<leader>b```` for find files and ```<leader>bg``` for show the commits

- **Utils for the editor**
  - ```Ctrl-ArrowKeys``` for natigate into the panels
  - ```Space w``` for save
  - ```Space q``` for close
  - ```Space so``` for reload
  - ````Tab and shift tab```` for advance and back into the buffers
  - `````> and <````` for indent and unindent
  - ````jk and Ctrl-c```` for go to the normal mode

## Installation

Steps for install this awesome neovim configuration:

1. Install Neovim [here](https://github.com/neovim/neovim)
2. Install the manager [pug.nvim](https://github.com/TeoDev1611/pug.nvim):

> Windows
```ps1
git clone https://github.com/kristijanhusak/vim-packager ~/AppData/Local/nvim/pack/packager/opt/vim-packager
iwr -useb https://raw.githubusercontent.com/TeoDev1611/pug.nvim/main/pug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/pug.vim" -Force
```

> Linux MacOS
```shell
git clone https://github.com/kristijanhusak/vim-packager ~/.config/nvim/pack/packager/opt/vim-packager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/pug.vim --create-dirs \
       https://raw.githubusercontent.com/TeoDev1611/pug.nvim/main/pug.vim'
```

3. Go to your neovim configuration directory

>Windows
````
cd $HOME\AppData\Local\nvim
````
> Linux MacOS
`````
cd $HOME/.config/nvim
`````

4. Clone the configuration into the folder **You need git**
```
git clone -b rocket https://github.com/TeoDev1611/RocketVim.git .
```

5. Finally enter into neovim for install and compile packer with this:
``
nvim +PugInstall
``

6. Check the [rocket.toml](https://github.com/TeoDev1611/RocketVim/blob/rocket/rocket.toml) for the custom aparience and options and uncomment and load the lua modules [here](https://github.com/TeoDev1611/RocketVim/blob/rocket/init.vim)

## ScreenShots

![image](https://user-images.githubusercontent.com/73144037/125671016-98731b4d-4fa2-4fe3-b412-aef0b3f02a22.png)

> Add your screenshots [here](https://github.com/TeoDev1611/RocketVim/issues/4)

## Lsp Setup

This configuration dont use the classic CoC.nvim is very slow however i use native lsp [here](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) can you install the servers and after add to [here](https://github.com/TeoDev1611/RocketVim/blob/rocket/lua/lsp/lsp-servers/init.lua)

## Install the language server for lua



---
Made with ❤ in Ecuador
