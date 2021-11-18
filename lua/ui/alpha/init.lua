local alpha = require 'alpha'
local startify = require 'alpha.themes.startify'
startify.section.header.val = {
  [[           _                         _           ]],
  [[          | |                       (_)          ]],
  [[  __ _ ___| |_ _ __ ___   _ ____   ___ _ __ ___  ]],
  [[ / _` / __| __| '__/ _ \ | '_ \ \ / / | '_ ` _ \ ]],
  [[| (_| \__ \ |_| | | (_) || | | \ V /| | | | | | |]],
  [[ \__,_|___/\__|_|  \___(_)_| |_|\_/ |_|_| |_| |_|]],
}

startify.section.footer = {
  { type = 'text', val = 'AstroVim - Teo' },
}

alpha.setup(startify.opts)
