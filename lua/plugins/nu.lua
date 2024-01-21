return {
  "LhKipp/nvim-nu",
  --build = ":TSInstall nu",
  ft = "nu",
  config = function()
    require("nu").setup({
      use_lsp_features = true,
      all_cmd_names = [[nu -c 'help commands | get name | str join "\n"']],
    })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true })
  end,
}
