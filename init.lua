--[[

  ______           
 /_  __/___   ____ 
  / /  / _ \ / __ \
 / /  /  __// /_/ /
/_/   \___/ \____/ 
                   
- github.com/TeoDev1611
- twitter.com/TeoDev1611

Made with love on Ecuador by Teo
--]]

require 'me.sets'
require 'me.plugins'
require 'me.maps'

-- Some plugins importants

require('cfg.ui').tree_sitter()

require 'impatient'
require('impatient').enable_profile()

vim.g.did_load_filetypes = 1

-- Some plugins configs
require 'cfg.things'
