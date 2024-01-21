return {
  {
    "nvim-lualine/lualine.nvim",
    event = "User FileOpened",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("eduardo.devicons")
      end,
    },
    config = function()
      require("eduardo.lualine")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    event = "User FileOpened",
    version = "*",
    config = function()
      require("eduardo.bufferline")
    end,
  },
  {
    "SmiteshP/nvim-navic",
    event = "User FileOpened",
    dependencies = "neovim/nvim-lspconfig",
    opts = {},
  },
}
