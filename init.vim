
"------------------------------------------------------------------------------"
"                                    NEOTEO                                    "
"------------------------------------------------------------------------------"
"------------------------------------------------------------------------------"
"                              Loading the plugins                             "
"------------------------------------------------------------------------------"

" For the Windows User :p
if has('win32') || has('win64')
  "load the plugis you not are a crazy man or yes?
  source ~/appdata/local/nvim/manager.vim
  " core settings
  source ~/appdata/local/nvim/core/sets.vim
  source ~/appdata/local/nvim/core/colors.vim
  source ~/appdata/local/nvim/core/maps.vim
  "old school settings
  source ~/appdata/local/nvim/oldschool/dein.vim
  source ~/appdata/local/nvim/oldschool/coc.vim
  source ~/appdata/local/nvim/oldschool/fzf.vim
  source ~/appdata/local/nvim/oldschool/dashboard.vim
  "langs
  source ~/appdata/local/nvim/oldschool/langs/go.vim
  "new world settings
  source ~/appdata/local/nvim/newworld/statusline.lua
  source ~/appdata/local/nvim/newworld/treesitter.lua
  source ~/appdata/local/nvim/newworld/tree.lua
endif

" For the Penguin and Apple user :p
if has('linux') || has('osxdarwin')
  "load the plugis you not are a crazy man or yes?
  source ~/.config/nvim/manager.vim
  " core settings
  source ~/.config/nvim/core/sets.vim
  source ~/.config/nvim/core/colors.vim
  source ~/.config/nvim/core/maps.vim
  "od school settings
  source ~/.config/nvim/oldschool/dein.vim
  source ~/.config/nvim/oldschool/coc.vim
  source ~/.config/nvim/oldschool/fzf.vim
  source ~/.config/nvim/oldschool/dashboard.vim
  "langs
  source ~/.config/nvim/oldschool/langs/go.vim
  "new world settings
  source ~/.config/nvim/newworld/statusline.lua
  source ~/.config/nvim/newworld/treesitter.lua
  source ~/.config/nvim/newworld/tree.lua
endif

