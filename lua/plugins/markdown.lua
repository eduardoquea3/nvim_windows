return {
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    keys = {
      { "<leader>m",  desc = "Markdown" },
      { "<leader>mi", "<cmd>MarkdownPreview<cr>",       desc = "Previsualizar markdown" },
      { "<leader>ms", "<cmd>MarkdownPrevieStop<cr>",    desc = "Parar previsualización markdown" },
      { "<leader>mc", "<cmd>MarkdownPreviewToggle<cr>", desc = "Cambiar previsualización markdown" },
    },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
