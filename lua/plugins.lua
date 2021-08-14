vim.cmd [[packadd packer.nvim]]
local packer = require "packer"

packer.init { max_jobs = 10, display = { open_fn = require("packer.util").float } }

local use = packer.use
packer.reset()

-- Package Managment
use "wbthomason/packer.nvim"

-- NativeLSP
use "folke/todo-comments.nvim"
use "folke/lsp-colors.nvim"
use {
  "neovim/nvim-lspconfig",
  config = function()
    require "lsp/lsp-servers"
  end,
}
use {
  "hrsh7th/nvim-compe",
  config = function()
    require "lsp/compe"
  end,
}
use {
  "glepnir/lspsaga.nvim",
  config = function()
    require "lsp/saga"
  end,
}
use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
use { "rafamadriz/friendly-snippets", event = "InsertCharPre" }

-- IDE Tools
use {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {
      disable_filetype = { "TelescopePrompt" },
    }

    require("nvim-autopairs.completion.compe").setup {
      map_cr = true, --  map <CR> on insert mode
      map_complete = true, -- it will auto insert `(` after select function or method item
      auto_select = false, -- auto select first item
    }
  end,
}

use {
  "terrortylor/nvim-comment",
  config = function()
    require("nvim_comment").setup()
  end,
  event = "BufRead",
}

use { "tpope/vim-fugitive", cmd = { "G" }, opt = true }
use {
  "cometsong/CommentFrame.vim",
  cmd = { "CommentFrameSlashes", "CommentFrameSlashStar", "CommentFrameHashDash", "CommentFrameQuoteDash" },
  opt = true,
}
use { "mbbill/undotree", cmd = "UndotreeToggle", opt = true }

-- Lang Configs
use { "editorconfig/editorconfig-vim", opt = true }

--Colors Config
use {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require "ide/tree-sitter"
  end,
}
use "p00f/nvim-ts-rainbow"
-- Colorschemes
use {
  "rafi/awesome-vim-colorschemes",
  config = function()
    require "ui/colors"
  end,
}
use {
  "Yagua/nebulous.nvim",
  config = function()
    require "ui/colors"
  end,
}
-- StatusLine
use {
  "glepnir/galaxyline.nvim",
  branch = "main",
  config = function()
    require "ui/galaxy"
  end,
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  event = "BufWinEnter",
}
-- File Explorer
use {
  "kyazdani42/nvim-tree.lua",
  requires = "kyazdani42/nvim-web-devicons",
  event = "BufWinEnter",
  config = function()
    require "ui/tree"
  end,
}

-- IDE Tools
use { "junegunn/goyo.vim", opt = true, cmd = "Goyo" }
use { "iamcco/markdown-preview.nvim", opt = true, run = "-> mkdp#util#install()", ft = "markdown" }

--Fuzzy Find
use {
  "glepnir/dashboard-nvim",
  config = function()
    vim.cmd [[let g:dashboard_default_executive = 'telescope']]
  end,
}
use {
  "nvim-telescope/telescope.nvim",
  requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
  config = function()
    require "ide/telescope"
  end,
}
-- Jump Motions
use {
  "phaazon/hop.nvim",
  as = "hop",
  config = function()
    require "ide/hop"
  end,
}

use {
  "rhysd/accelerated-jk",
}

use {
  "akinsho/nvim-bufferline.lua",
  requires = "kyazdani42/nvim-web-devicons",
  event = "BufWinEnter",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {}
  end,
}
use {
  "lewis6991/gitsigns.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("gitsigns").setup()
  end,
}

use "sheerun/vim-polyglot"
