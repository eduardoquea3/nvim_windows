return {
  "utilyre/barbecue.nvim",
  event = "User FileOpened",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    show_dirname = false,
    show_basename = false,
    exclue_filetypes = {
      "gitcommit",
      "toggleterm",
      "neo-tree",
      "dashboard",
    },
  },
}
