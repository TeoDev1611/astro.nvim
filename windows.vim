"------------------------------------------------------------------------------"
"                         Load the Plugins for Windows                         "
"------------------------------------------------------------------------------"

"load the plugis you not are a crazy man or yes?
source ~/appdata/local/nvim/manager.vim
" core settings
source ~/appdata/local/nvim/core/sets.vim
source ~/appdata/local/nvim/core/colors.vim
source ~/appdata/local/nvim/core/maps.vim
"old school settings
source ~/appdata/local/nvim/oldschool/coc.vim
source ~/appdata/local/nvim/oldschool/fzf.vim
source ~/appdata/local/nvim/oldschool/startify.vim
source ~/appdata/local/nvim/oldschool/netrw.vim
"langs
source ~/appdata/local/nvim/oldschool/langs/go.vim
"new world settings
luafile ~/appdata/local/nvim/newworld/statusline.lua
luafile ~/appdata/local/nvim/newworld/treesitter.lua
luafile ~/appdata/local/nvim/newworld/tree.lua
