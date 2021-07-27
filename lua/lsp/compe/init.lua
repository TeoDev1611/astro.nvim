vim.o.completeopt = "menuone,noselect"

  require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = true,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 30,
    max_kin_width = 4,
    max_menu_width = 4,
    documentation = true,
    source = {
      path = {
        menu = "率"
      },
      buffer = {
        menu = "﬘"
      },
      calc = {
        menu = ""
      },
      vsnip = {
        menu = ""
      },
      nvim_lsp = {
        menu = ""
      },
      nvim_lua = true,
      tabnine = false,
      -- tabnine = {
      --   max_line = 100;
      --   max_num_results = 10;
      --   priority = 20;
      --   menu = "";
      -- };
      spell = {menu = "暈"},
      tags = {menu = ""},
      snippets_nvim = false,
      treesitter = {menu = ""}
    }
  }

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
