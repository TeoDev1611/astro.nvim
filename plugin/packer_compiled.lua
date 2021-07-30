-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command("packadd packer.nvim")

local no_errors, error_msg = pcall(function()
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b)
      return a[2] > b[2]
    end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then
        results[i] = elem[1] .. " took " .. elem[2] .. "ms"
      end
    end

    _G._packer = _G._packer or {}
    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
    "C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
  local install_cpath_pattern =
    "C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ";" .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ";" .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s))
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify(
          "packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
          vim.log.levels.ERROR,
          {}
        )
      end)
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ["CommentFrame.vim"] = {
      commands = { "CommentFrameSlashes", "CommentFrameSlashStar", "CommentFrameHashDash", "CommentFrameQuoteDash" },
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\CommentFrame.vim",
    },
    ["FixCursorHold.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\FixCursorHold.nvim",
    },
    amora = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\amora",
    },
    ["awesome-vim-colorschemes"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\awesome-vim-colorschemes",
    },
    ["compe-tabnine"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\compe-tabnine",
    },
    ["editorconfig-vim"] = {
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\editorconfig-vim",
    },
    ["fern-renderer-nerdfont.vim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fern-renderer-nerdfont.vim",
    },
    ["fern.vim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fern.vim",
    },
    ["friendly-snippets"] = {
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\friendly-snippets",
    },
    ["glyph-palette.vim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\glyph-palette.vim",
    },
    ["goyo.vim"] = {
      commands = { "Goyo" },
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\goyo.vim",
    },
    ["lspsaga.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim",
    },
    ["lualine.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim",
    },
    ["markdown-preview.nvim"] = {
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim",
    },
    ["nerdfont.vim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nerdfont.vim",
    },
    ["nvim-compe"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-compe",
    },
    ["nvim-lspconfig"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig",
    },
    ["nvim-treesitter"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter",
    },
    ["nvim-ts-rainbow"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow",
    },
    ["nvim-web-devicons"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons",
    },
    ["packer.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim",
    },
    ["pears.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\pears.nvim",
    },
    ["plenary.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim",
    },
    ["popup.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim",
    },
    ["presence.nvim"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\presence.nvim",
    },
    ["rust.vim"] = {
      loaded = false,
      needs_bufread = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\rust.vim",
    },
    ["startuptime.vim"] = {
      commands = { "StartupTime" },
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\startuptime.vim",
    },
    ["telescope.nvim"] = {
      commands = { "Telescope" },
      config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18ide/telescope\frequire\0" },
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\telescope.nvim",
    },
    undotree = {
      commands = { "UndotreeToggle" },
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\undotree",
    },
    vim = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim",
    },
    ["vim-commentary"] = {
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-commentary",
    },
    ["vim-devicons"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-devicons",
    },
    ["vim-fugitive"] = {
      commands = { "G" },
      loaded = false,
      needs_bufread = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-fugitive",
    },
    ["vim-go"] = {
      loaded = false,
      needs_bufread = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-go",
    },
    ["vim-smoothie"] = {
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-smoothie",
    },
    ["vim-startify"] = {
      loaded = false,
      needs_bufread = false,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-startify",
    },
    ["vim-vsnip"] = {
      loaded = true,
      path = "C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip",
    },
  }

  time([[Defining packer_plugins]], false)

  -- Command lazy-loads
  time([[Defining lazy-load commands]], true)
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Goyo lua require("packer.load")({'goyo.vim'}, { cmd = "Goyo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file CommentFrameSlashes lua require("packer.load")({'CommentFrame.vim'}, { cmd = "CommentFrameSlashes", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file CommentFrameSlashStar lua require("packer.load")({'CommentFrame.vim'}, { cmd = "CommentFrameSlashStar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file CommentFrameHashDash lua require("packer.load")({'CommentFrame.vim'}, { cmd = "CommentFrameHashDash", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file CommentFrameQuoteDash lua require("packer.load")({'CommentFrame.vim'}, { cmd = "CommentFrameQuoteDash", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load commands]], false)

  vim.cmd([[augroup packer_load_aucmds]])
  vim.cmd([[au!]])
  -- Filetype lazy-loads
  time([[Defining lazy-load filetype autocommands]], true)
  vim.cmd([[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]])
  vim.cmd([[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]])
  vim.cmd(
    [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
  time([[Defining lazy-load event autocommands]], true)
  vim.cmd(
    [[au BufWinEnter * ++once lua require("packer.load")({'vim-startify', 'vim-smoothie'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
  )
  vim.cmd(
    [[au BufRead * ++once lua require("packer.load")({'vim-commentary'}, { event = "BufRead *" }, _G.packer_plugins)]]
  )
  vim.cmd(
    [[au InsertCharPre * ++once lua require("packer.load")({'friendly-snippets'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load event autocommands]], false)
  vim.cmd("augroup END")
  vim.cmd([[augroup filetypedetect]])
  time(
    [[Sourcing ftdetect script at: C:\Users\Usuario1\AppData\Local\nvim-data\site\pack\packer\opt\rust.vim\ftdetect\rust.vim]],
    true
  )
  vim.cmd([[source C:\Users\Usuario1\AppData\Local\nvim-data\site\pack\packer\opt\rust.vim\ftdetect\rust.vim]])
  time(
    [[Sourcing ftdetect script at: C:\Users\Usuario1\AppData\Local\nvim-data\site\pack\packer\opt\rust.vim\ftdetect\rust.vim]],
    false
  )
  time(
    [[Sourcing ftdetect script at: C:\Users\Usuario1\AppData\Local\nvim-data\site\pack\packer\opt\vim-go\ftdetect\gofiletype.vim]],
    true
  )
  vim.cmd([[source C:\Users\Usuario1\AppData\Local\nvim-data\site\pack\packer\opt\vim-go\ftdetect\gofiletype.vim]])
  time(
    [[Sourcing ftdetect script at: C:\Users\Usuario1\AppData\Local\nvim-data\site\pack\packer\opt\vim-go\ftdetect\gofiletype.vim]],
    false
  )
  vim.cmd("augroup END")
  if should_profile then
    save_profiles()
  end
end)

if not no_errors then
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: '
      .. error_msg
      .. '" | echom "Please check your config for correctness" | echohl None'
  )
end
