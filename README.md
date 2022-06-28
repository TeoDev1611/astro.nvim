## astro.nvim :new_moon:

<div align="center">
<img src="./docs/dash.JPG" alt="Neovim Dashboard">
</div>

This is my personal version _not distro, not issues_ **only for my personal use
and as reference for write a new config**

### Requirements :books:

- [Git](https://git-scm.com)
- Gcc
- Curl

> More detailed installation [here](#Markdown)

- Pandoc
- Npm Live Server

### Installation :package:

> :warning: Non updated correctly this could not work!

- Install Windows :window:

```ps1
## Download the Config
git clone https://github.com/TeoDev1611/astro.nvim $HOME/AppData/Local/nvim --depth 1
## Download the Installer
Invoke-WebRequest https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.ps1 -OutFile installer.ps1
## Set the permissions
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
## Run the Installer 
./installer.ps1 ~/.cache/dein
## Install the plugins
nvim +DeinInstall
```

- Install Linux :penguin: MacOS :apple:

```sh
# Download the Config
git clone https://github.com/TeoDev1611/astro.nvim $HOME/.config/nvim --depth 1
## Download the Installer
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
## Run the installer
sh ./installer.sh ~/.cache/dein
## Install the Plugins
nvim +DeinInstall
```

### Markdown

For use the `MarkdownPreview` you need install this:

- Pandoc:

  - Install Windows :window:
  ```ps1
  scoop install pandoc
  ## Or with chocolatey!
  choco install pandoc
  ```
- Install MacOS :apple:
  ```
  brew install pandoc
  ```
- Install Linux :penguin:
  ```sh
  sudo apt install pandoc
  # Or for fedora:
  sudo dnf install pandoc
  ## For the other distros check in pandoc.org
  ```
- Npm Live server

> :warning: You need have installed [node](https://nodejs.org) and npm

```
npm install -g --force @compodoc/live-server
```

### Versions :mega:

This version works with Lua with Packer as package manager, check **nightly**
for other version! Updated and improved with new tools!

> Always a WIP :alien:

---

Made with :heart: in Ecuador
