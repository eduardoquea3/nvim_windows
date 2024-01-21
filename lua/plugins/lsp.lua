return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ui = {
            border = "rounded",
          },
        },
      },
      "williamboman/mason-lspconfig.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("eduardo.lsp")
    end,
  },
}
