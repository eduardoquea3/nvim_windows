return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "rafamadriz/friendly-snippets",
      -- "chrisgrieser/cmp-nerdfont",
      "davidmh/cmp-nerdfonts",
      "saadparwaiz1/cmp_luasnip",
      -- "onsails/lspkind-nvim",
      { "L3MON4D3/LuaSnip", version = "v1.*" },
    },
    event = { "InsertEnter" },
    config = function()
      require("eduardo.cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    config = function()
      require("tailwindcss-colors").setup()
    end,
    ft = { "astro", "html", "javascriptreact", "typescriptreact" },
  },
  {
    "js-everts/cmp-tailwind-colors",
    config = function()
      require("cmp-tailwind-colors").setup({
        enable_alpha = true,
        format = function(itemColor)
          return {
            fg = itemColor,
            bg = itemColor,
            text = "  ",
          }
        end
      })
    end,
    ft = { "astro", "html", "javascriptreact", "typescriptreact" },
  },
}
