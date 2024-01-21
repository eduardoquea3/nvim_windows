return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function ()
      require("eduardo.autopairs")
    end
  },
  {
    "windwp/nvim-ts-autotag",
    event = "User FileOpened",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html",
          "javascriptreact",
          "typescriptreact",
          "tsx",
          "jsx",
          "xml",
          "markdown",
          "astro",
        },
      })
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            underline = true,
            virtual_text = {
              spacing = 5,
              severity_limit = "Warning",
            },
            update_in_insert = true,
          })
      require("nvim-treesitter.configs").setup({
        autotag = {
          enable = true,
          enale_rename = true,
          enable_close = true,
          enable_close_on_slash = true,
        },
      })
    end,
  },
}
