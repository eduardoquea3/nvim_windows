local componente = require("eduardo.lualine.componentes")
require("lualine").setup({
  options = {
    icons_enabled = true,
    -- theme = "onedark",
    theme = "tokyonight",
    -- component_separators = { left = "|", right = "|" },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    -- section_separators = { left = "|", right = "|" },
    disabled_filetypes = {
      "neo-tree",
      "TelescopePrompt",
      "dashboard",
      "help",
      "qt",
    },
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = { componente.left, componente.treesitter },
    lualine_b = { componente.branch, componente.macro },
    lualine_c = { componente.diff, componente.diagnostics },
    lualine_x = { componente.lsp },
    lualine_y = { componente.spaces },
    lualine_z = { componente.location, componente.right },
  },
  extensions = { "neo-tree", "lazy", "toggleterm", "trouble", "mason" },
})
