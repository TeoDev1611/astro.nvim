vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
  -- Package Managment
  use("wbthomason/packer.nvim")

  -- NativeLSP
  use("neovim/nvim-lspconfig")
  use("hrsh7th/nvim-compe")
  use("glepnir/lspsaga.nvim")
  use("hrsh7th/vim-vsnip")
  use({ "rafamadriz/friendly-snippets", event = "InsertCharPre" })

  -- IDE Tools
  use({ "tpope/vim-commentary", event = "BufRead" })
  use("steelsojka/pears.nvim")
  use({ "tpope/vim-fugitive", cmd = { "G" }, opt = true })
  use({
    "cometsong/CommentFrame.vim",
    cmd = { "CommentFrameSlashes", "CommentFrameSlashStar", "CommentFrameHashDash", "CommentFrameQuoteDash" },
    opt = true,
  })
  use({ "mbbill/undotree", cmd = "UndotreeToggle", opt = true })

  -- Lang Configs
  use({ "rust-lang/rust.vim", ft = "rust" }) -- Rust Lang
  use({ "fatih/vim-go", ft = "go" }) -- Golang
  use({ "editorconfig/editorconfig-vim", opt = true })

  --Colors Config
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("p00f/nvim-ts-rainbow")
  -- Icons
  use("kyazdani42/nvim-web-devicons")
  use("ryanoasis/vim-devicons")
  -- Colorschemes
  use("rafi/awesome-vim-colorschemes")
  use("owozsh/amora")
  use("embark-theme/vim")
  -- StatusLine
  use({
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  -- File Explorer
  use("lambdalisue/fern.vim")
  use("antoinemadec/FixCursorHold.nvim")
  use("lambdalisue/fern-renderer-nerdfont.vim")
  use("lambdalisue/nerdfont.vim")
  use("lambdalisue/glyph-palette.vim")

  -- IDE Tools
  use({ "junegunn/goyo.vim", opt = true, cmd = "Goyo" })
  use({ "tweekmonster/startuptime.vim", opt = true, cmd = "StartupTime" })
  use({ "iamcco/markdown-preview.nvim", opt = true, run = "-> mkdp#util#install()", ft = "markdown" })

  -- Aparience
  use({ "mhinz/vim-startify", opt = true, event = "BufWinEnter" })
  use("andweeb/presence.nvim")
  use({ "psliwka/vim-smoothie", opt = true, event = "BufWinEnter" })

  --Fuzzy Find
  use({
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    cmd = "Telescope",
    config = function()
      require("ide/telescope")
    end,
  })

  -- Jump Motions
  use {
    'phaazon/hop.nvim',
    as = 'hop',
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

end)
