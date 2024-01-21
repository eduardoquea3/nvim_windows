return {
  {
    "VonHeikemen/searchbox.nvim",
    Lazy = true,
    keys = {
      { "<c-f>", "<cmd>SearchBoxIncSearch visual_mode=true<cr>", desc = "Search", mode = { "v" } },
      { "<c-f>",         "<cmd>SearchBoxIncSearch<cr>",                  desc = "Search" },
    },
    dependencies = { "MunifTanjim/nui.nvim" },
  },
}
