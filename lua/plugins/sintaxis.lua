return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "astro",
          "css",
          "html",
          "http",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "yaml",
        },
        ignore_install = { "luadoc", "wgsl_bevy" },
        highlight = {
          enable = true,
        },
        indent = {
          enable = false,
        },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "smoka7/multicursors.nvim",
    lazy = true,
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {
      hint_config = false,
    },
    cmd = { "MCstart", "MCvisual", "Mcclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      { "<c-n>", "<cmd>MCstart<cr>", mode = { "v", "n" }, desc = "Multicursor" },
    },
  },
}
