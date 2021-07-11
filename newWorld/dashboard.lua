O.plugin.dashboard = {
  custom_header = {
"███╗   ██╗███████╗ ██████╗ ████████╗███████╗ ██████╗",
"████╗  ██║██╔════╝██╔═══██╗╚══██╔══╝██╔════╝██╔═══██╗",
"██╔██╗ ██║█████╗  ██║   ██║   ██║   █████╗  ██║   ██║",
"██║╚██╗██║██╔══╝  ██║   ██║   ██║   ██╔══╝  ██║   ██║",
"██║ ╚████║███████╗╚██████╔╝   ██║   ███████╗╚██████╔╝",
"╚═╝  ╚═══╝╚══════╝ ╚═════╝    ╚═╝   ╚══════╝ ╚═════╝",
  },

  custom_section = {
    a = {
      description = { "  Find File          " },
      command = "Leaderf files --popup",
    },
    b = {
      description = { "  Recently Used Files" },
      command = "Telescope oldfiles",
    },
    c = {
      description = { "  Find Word          " },
      command = "Telescope line --popup",
    },
    d = {
      description = { "  Find help         " },
      command = "Leaderf help --popup",
    },
  },

  footer = { "github.com/TeoDev1611/neoteo" },
}

vim.g.dashboard_custom_header = O.plugin.dashboard.custom_header
vim.g.dashboard_custom_section = O.plugin.dashboard.custom_section
