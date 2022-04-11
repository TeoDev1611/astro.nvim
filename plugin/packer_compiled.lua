-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', { 'nvim-0.5' }) ~= 1 then
  vim.api.nvim_command 'echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"'
  return
end

vim.api.nvim_command 'packadd packer.nvim'

local no_errors, error_msg = pcall(function()
  local time
  local profile_info
  local should_profile = true
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
        results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
      end
    end

    _G._packer = _G._packer or {}
    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
    'C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua'
  local install_cpath_pattern =
    'C:\\Users\\Usuario1\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so'
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ';' .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ';' .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(function()
        vim.api.nvim_notify(
          'packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
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
    ['Comment.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Comment.nvim',
      url = 'https://github.com/numToStr/Comment.nvim',
    },
    ['Spacegray.vim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\Spacegray.vim',
      url = 'https://github.com/ackyshake/Spacegray.vim',
    },
    ['TrueZen.nvim'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\TrueZen.nvim',
      url = 'https://github.com/Pocco81/TrueZen.nvim',
    },
    ['accelerated-jk'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\accelerated-jk',
      url = 'https://github.com/rhysd/accelerated-jk',
    },
    ['better-escape.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\better-escape.nvim',
      url = 'https://github.com/max397574/better-escape.nvim',
    },
    ['bufferline.nvim'] = {
      config = {
        '\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0\'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\15bufferline\vcfg.ui\frequire\0',
      },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\bufferline.nvim',
      url = 'https://github.com/akinsho/bufferline.nvim',
    },
    ['editorconfig.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\editorconfig.nvim',
      url = 'https://github.com/gpanders/editorconfig.nvim',
    },
    ['filetype.nvim'] = {
      config = { '\27LJ\2\n4\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\23did_load_filetypes\6g\bvim\0' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\filetype.nvim',
      url = 'https://github.com/nathom/filetype.nvim',
    },
    ['gina.vim'] = {
      commands = { 'Gina' },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\gina.vim',
      url = 'https://github.com/lambdalisue/gina.vim',
    },
    ['github-nvim-theme'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\github-nvim-theme',
      url = 'https://github.com/projekt0n/github-nvim-theme',
    },
    ['gitsigns.nvim'] = {
      config = { '\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0\'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0' },
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim',
      url = 'https://github.com/lewis6991/gitsigns.nvim',
    },
    ['impatient.nvim'] = {
      config = { '\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0\'\2\1\0B\0\2\1K\0\1\0\14impatient\frequire\0' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\impatient.nvim',
      url = 'https://github.com/lewis6991/impatient.nvim',
    },
    ['lualine.nvim'] = {
      config = { '\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0\'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\flualine\vcfg.ui\frequire\0' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\lualine.nvim',
      url = 'https://github.com/nvim-lualine/lualine.nvim',
    },
    ['minimap.vim'] = {
      commands = { 'Minimap', 'MinimapClose', 'MinimapToggle', 'MinimapRefresh', 'MinimapUpdateHighlight' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\minimap.vim',
      url = 'https://github.com/wfxr/minimap.vim',
    },
    neoformat = {
      commands = { 'Neoformat' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\neoformat',
      url = 'https://github.com/sbdchd/neoformat',
    },
    ['nvim-autopairs'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs',
      url = 'https://github.com/windwp/nvim-autopairs',
    },
    ['nvim-tree.lua'] = {
      commands = {
        'NvimTreeClipboard',
        'NvimTreeClose',
        'NvimTreeFindFile',
        'NvimTreeOpen',
        'NvimTreeRefresh',
        'NvimTreeToggle',
      },
      config = { '\27LJ\2\n(\0\0\3\0\2\0\0046\0\0\0\'\2\1\0B\0\2\1K\0\1\0\rcfg.tree\frequire\0' },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\nvim-tree.lua',
      url = 'https://github.com/kyazdani42/nvim-tree.lua',
    },
    ['nvim-treesitter'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter',
      url = 'https://github.com/nvim-treesitter/nvim-treesitter',
    },
    ['nvim-ts-rainbow'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow',
      url = 'https://github.com/p00f/nvim-ts-rainbow',
    },
    ['nvim-web-devicons'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons',
      url = 'https://github.com/kyazdani42/nvim-web-devicons',
    },
    ['octo.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\octo.nvim',
      url = 'https://github.com/pwntester/octo.nvim',
    },
    ['packer.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim',
      url = 'https://github.com/wbthomason/packer.nvim',
    },
    ['plenary.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim',
      url = 'https://github.com/nvim-lua/plenary.nvim',
    },
    ['popup.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim',
      url = 'https://github.com/nvim-lua/popup.nvim',
    },
    ['telescope-fzy-native.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-fzy-native.nvim',
      url = 'https://github.com/nvim-telescope/telescope-fzy-native.nvim',
    },
    ['telescope-software-licenses.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-software-licenses.nvim',
      url = 'https://github.com/chip/telescope-software-licenses.nvim',
    },
    ['telescope.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim',
      url = 'https://github.com/nvim-telescope/telescope.nvim',
    },
    ['vim-startify'] = {
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-startify',
      url = 'https://github.com/mhinz/vim-startify',
    },
    ['vim-visual-multi'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi',
      url = 'https://github.com/mg979/vim-visual-multi',
    },
    ['vscode.nvim'] = {
      loaded = true,
      path = 'C:\\Users\\Usuario1\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vscode.nvim',
      url = 'https://github.com/Mofiqul/vscode.nvim',
    },
  }

  time([[Defining packer_plugins]], false)
  -- Config for: gitsigns.nvim
  time([[Config for gitsigns.nvim]], true)
  try_loadstring(
    '\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0\'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0',
    'config',
    'gitsigns.nvim'
  )
  time([[Config for gitsigns.nvim]], false)

  -- Command lazy-loads
  time([[Defining lazy-load commands]], true)
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Gina lua require("packer.load")({'gina.vim'}, { cmd = "Gina", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Minimap lua require("packer.load")({'minimap.vim'}, { cmd = "Minimap", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file MinimapClose lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file MinimapRefresh lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file MinimapUpdateHighlight lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapUpdateHighlight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeOpen lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeRefresh lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeRefresh", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeFindFile lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file NvimTreeClipboard lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClipboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load commands]], false)

  vim.cmd [[augroup packer_load_aucmds]]
  vim.cmd [[au!]]
  -- Event lazy-loads
  time([[Defining lazy-load event autocommands]], true)
  vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'TrueZen.nvim', 'bufferline.nvim', 'lualine.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
  vim.cmd [[au VimEnter * ++once lua require("packer.load")({'impatient.nvim', 'vim-startify', 'filetype.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
  time([[Defining lazy-load event autocommands]], false)
  vim.cmd 'augroup END'
  if should_profile then
    save_profiles()
  end
end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: '
      .. error_msg
      .. '" | echom "Please check your config for correctness" | echohl None'
  )
end
