require("nvim-web-devicons").setup({
  override = {},
  color_icons = true,
  default = true,
  strict = true,
  override_by_filename = {
    ["node_modules"] = {
      icon = "",
      color = "#0f6600",
      cterm_color = "197",
      name = "NodeModules",
    },
  },
  override_by_extension = {
    ["luacheckrc"] = {
      icon = "",
      color = "#51a0cf",
      name = "Lua",
    },
    ["astro"] = {
      icon = "󱎯",
      color = "#ffb35f",
      name = "Astro",
    },
    ["http"] = {
      icon = "󰇧",
      color = "#49b5ff",
      name = "Http",
    },
  },
})
