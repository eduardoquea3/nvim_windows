return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local function key(shortcut)
      shortcut.icon_hl = shortcut.icon_hl or "Title"
      shortcut.desc_hl = shortcut.desc_hl or "String"
      shortcut.key_hl = shortcut.key_hl or "Keyword"
      return shortcut
    end
    local icon = require("eduardo.icons")
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          "",
          "",
          "",
          " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
          " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
          " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
          " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
          " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
          " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
          "",
          "",
        },
        center = {
          key({
            icon = icon.ui.Files .. " ",
            desc = "Find Files",
            key = "f",
            action = "Telescope find_files",
          }),
          key({
            icon = icon.ui.FileSymlink .. " ",
            desc = "Find Oldfiles",
            key = "o",
            action = "Telescope oldfiles",
          }),
          key({ icon = icon.ui.Text .. " ", desc = "Find Word", key = "g", action = "Telescope live_grep" }),
          key({ icon = icon.ui.Package .. " ", desc = "Plugins", key = "ll", action = "Lazy" }),
          key({ icon = icon.ui.Project .. " ", desc = "Project", key = "p", action = "Telescope project" }),
          key({ icon = icon.ui.Project .. " ", desc = "Help", key = "fh", action = "Telescope help_tags" }),
          key({ icon = icon.ui.Close .. " ", desc = "Quit", key = "q", action = "quit" }),
        },
        footer = { "🎉 No Code, No Bug 🎉", "🎉 如无必要，勿增实体 🎉" },
      },
    })
  end,
}
