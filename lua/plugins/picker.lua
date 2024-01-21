return {
  {
    "NvChad/nvim-colorizer.lua",
    event = "User FileOpened",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          RGB = true,
          RRGGBB = true,
          names = false,
          RRGGBBAA = true,
          AARRGGBB = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
          mode = "background",
          always_update = true,
        },
      })
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    lazy = true,
    keys = {
      { "cp",    "<cmd>CccPick<cr>",    desc = "Color Picker" },
      { "cc",    "<cmd>CccConvert<cr>", desc = "Color Convert" },
      { "<C-c>", "<cmd>CccPick<cr>",    desc = "Color Picker", mode = { "i" } },
    },
    config = true,
  },
}
