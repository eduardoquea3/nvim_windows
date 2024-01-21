local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})
mason_lspconfig.setup({
  ensure_installed = {
    "tsserver",
    "astro",
    "jdtls",
    "jsonls",
    "lua_ls",
    "pyright",
    "yamlls",
    "emmet_ls",
    "html",
    "cssls",
    "rust_analyzer",
    "tailwindcss",
  },
  automatic_installation = true,
})
