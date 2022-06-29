local utils = require 'me.util'
local logs = require 'me.logs'
local alias = {
  run = 'hook_source',
  ft = 'on_ft',
  on = 'on_cmd',
  branch = 'rev',
  module = 'on_lua',
  cond = 'on_if',
  event = 'on_event',
  func = 'on_func',
}

local defaults = {
  home = utils.path_join(vim.fn.fnamemodify('~', ':p'), '.cache', 'dein'),
  git = {
    hub = 'github.com',
    path = 'git',
    protocol = 'https',
    pull = 'pull --ff --ff-only',
    token = '',
    timeout = '120',
  },
  ui = {
    progress = 'echo',
    log = '',
    icon = '',
  },
}

local configs = {}

local function settings(cfg)
  configs = cfg
  if type(cfg) ~= 'table' then
    logs:log('info', 'Not found a table using the defaults values')
    configs = defaults
  end
  vim.g['dein#cache_directory'] = configs.home
  vim.g['dein#install_github_api_token'] = configs.git.token
  vim.g['dein#install_progress_type'] = configs.ui.progress
  vim.g['dein#install_log_filename'] = configs.ui.log
  vim.g['dein#notification_icon'] = configs.ui.icon
  vim.g['dein#types#git#command_path'] = configs.git.path
  vim.g['dein#types#git#default_hub_site'] = configs.git.hub
  vim.g['dein#types#git#default_protocol'] = configs.git.protocol
  vim.g['dein#types#git#pull_command'] = configs.git.pull
  vim.g['dein#install_process_timeout'] = configs.git.timeout
end

local function use(plugin)
  if type(plugin) == 'string' then
    vim.fn['dein#add'](plugin)
  else
    local name = plugin[1]
    plugin[1] = nil
    if vim.fn.type(plugin) == vim.v.t_list then
      vim.fn['dein#add'](name)
    else
      for key, value in pairs(alias) do
        if plugin[key] ~= nil then
          plugin[value] = plugin[key]
        end
      end
      local opts = plugin
      vim.fn['dein#add'](name, opts)
    end
  end
end

local function optsTOML(file)
  if type(file) == 'string' then
    vim.fn['dein#load_toml'](file)
  else
    local name = file[1]
    file[1] = nil
    if vim.fn.type(file) == vim.v.t_list then
      vim.fn['dein#load_toml'](name)
    else
      local opts = file
      vim.fn['dein#load_toml'](name, opts)
    end
  end
end

local function startup(config)
  if vim.fn.has 'nvim' == 0 then
    logs:log('error', 'Neovim is necessary!')
    return
  end
  vim.fn['dein#begin'](defaults.home)
  config(use)
  vim.fn['dein#end']()

  -- For fix the syntax
  vim.cmd [[
	filetype plugin indent on
	syntax enable
]]
end

local function load_toml(path)
  if vim.fn['dein#load_state'](defaults.home) == 1 then
    vim.fn['dein#begin'](defaults.home)
    path(optsTOML)
    vim.fn['dein#end']()
    vim.fn['dein#save_state']()
  end
end

local function setup(config)
  if vim.fn.has 'nvim' == 0 then
    logs:log('error', 'Neovim is necessary!')
    return
  end
  vim.fn['dein#begin'](defaults.home)
  for _, plugin in pairs(config) do
    use(plugin)
  end
  vim.fn['dein#end']()

  -- For fix the syntax
  vim.cmd [[
  	filetype plugin indent on
	syntax enable
  ]]
end

local function new_plugins()
  if vim.fn['dein#check_install'] == 1 then
    logs:log('info', 'Installing the new plugins!')
    vim.fn['dein#install']()
  end
end

-- Send all Functions!!
return {
  startup = startup,
  setup = setup,
  settings = settings,
  configs = configs,
  new_plugins = new_plugins,
  load_toml = load_toml,
  check_install = vim.fn['dein#check_install'],
  install = vim.fn['dein#install'],
  update = vim.fn['dein#update'],
  reinstall = vim.fn['dein#reinstall'],
  remote_plugins = vim.fn['dein#remote_plugins'],
}
