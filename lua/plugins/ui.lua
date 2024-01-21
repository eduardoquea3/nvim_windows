return {
  {
    "xiyaowong/transparent.nvim",
    enabled = false,
    config = function()
      require("eduardo.opacity")
    end,
  },
  {
    "folke/noice.nvim",
    event = "User FileOpened",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      max_width = 60,
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      require("notify").setup({
        fps = 60,
        background_colour = "NormalFloat",
        render = "wrapped-compact",
        stages = "slide",
        timeout = 1000,
      })
      vim.notify = notify
    end,
  },
}
