vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Package Managment
  use 'wbthomason/packer.nvim'

  -- NativeLSP
  use 'neovim/nvim-lspconfig'
  use {'hrsh7th/nvim-compe', event = "InsertEnter"}
  use {'glepnir/lspsaga.nvim', opt=true, cmd= {"Lspsaga"}}
  use {'hrsh7th/vim-vsnip', event= "InsertCharPre"}
  use 'hrsh7th/vim-vsnip-integ'
  use 'folke/lsp-colors.nvim'

  -- IDE Tools
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'
  use {'tpope/vim-fugitive', cmd= {"G"}}
  use {'cometsong/CommentFrame.vim', cmd={"CommentFrameSlashes","CommentFrameSlashStar", "CommentFrameHashDash","CommentFrameQuoteDash"}}
  use {'mbbill/undotree', cmd="UndotreeToggle"}

  -- Lang Configs
  use {'rust-lang/rust.vim', ft="rust"} -- Rust Lang
  use {'fatih/vim-go', ft="go"} -- Golang
  use {'editorconfig/editorconfig-vim'}

  --Colors Config
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
  use 'p00f/nvim-ts-rainbow'
  -- Icons
  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  -- Colorschemes
  use 'rafi/awesome-vim-colorschemes'
  use 'owozsh/amora'
  use 'embark-theme/vim'
  -- StatusLine
  use {'itchyny/lightline.vim', event='BufWinEnter'}
  use {'mengelbrecht/lightline-bufferline', event="BufWinEnter"}
  -- File Explorer
  use 'lambdalisue/fern.vim'
  use 'antoinemadec/FixCursorHold.nvim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'

  -- IDE Tools
  use {'junegunn/goyo.vim', cmd="Goyo"}
  use {'tweekmonster/startuptime.vim', cmd="StartupTime"}
  use {'iamcco/markdown-preview.nvim', run="-> mkdp#util#install()", ft="markdown"}

  -- Aparience
  use {'mhinz/vim-startify', event="BufWinEnter"}
  use 'andweeb/presence.nvim'
  use {'psliwka/vim-smoothie', event="BufWinEnter"}

  --Fuzzy Find
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    cmd='Telescope'
  }

end)
