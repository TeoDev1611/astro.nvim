<div align="center">


  
  # :rocket: RocketVim
  
  <q>Blazing faster neovim configuration made for a IDE use with Vim</q>

</div>

## Commands, Maps and Plugins

- **Intelljsense** This have 2 options the [NativeLSP](https://github.com/neovim/nvim-lspconfig) and the [CoC.nvim](https://github.com/neoclide/coc.nvim) support you can select this in the manager settings in the [settings section](# Settings) you can check this :sunglasses:

- **Comments** The comment tool what use is [vim-commentary](https://github.com/tpope/vim-commentary) this can be activate with gcc and gc can you see the documentation for this amazing tool in the repository all settings are the default.

- **Pairs** For the pairs in the brackets i use [autopairs](https://github.com/jiangmiao/auto-pairs)

- **Which Key** for help you with some commands I use [wichKey](https://github.com/folke/which-key.nvim)

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

- **Tree file explorer** I use netrw the native tree explorer or the External file explorer called [Nvim Tree](https://github.com/kyazdani42/nvim-tree.lua)
  - **Nvim Tree** for open this you can use ```<leader>m``` in this case leader is space
  - **Netrw** for open this you can use ```<leader>n``` in this case leader is space

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
2. Install the manager:

> Windows
````ps1
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
````
> Linux MacOS
````shell
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
````

3. Go to your neovim configuration directory

>Windows
````
cd AppData\Local\nvim
````
> Linux MacOS
`````
cd $HOME/.config/nvim
`````

4. Clone the configuration into the folder **You need git**
```
git clone -b rocket https://github.com/TeoDev1611/RocketVim.git .
```
5. Enter into nvim with this command
````
nvim +PlugInstall
````

## ScreenShots

![image](https://user-images.githubusercontent.com/73144037/125671016-98731b4d-4fa2-4fe3-b412-aef0b3f02a22.png)

> Add your screenshots [here](https://github.com/TeoDev1611/RocketVim/issues/4)

---
Made with ❤ in Ecuador
