local filetype_attach = setmetatable({}, {
  __index = function()
    return function() end
  end,
})

local key = vim.keymap.set

return function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  key("n", "K", ":Lspsaga hover_doc<cr>", { desc = "Documentacion" })
  key("n", "<leader>ca", ":Lspsaga code_action<cr>", { desc = "Code-Action" })
  key("n", "<leader>dff", ":Lspsaga peek_definition<cr>", { desc = "Definicion" })
  key("n", "<leader>dtf", ":Lspsaga peek_type_definition<cr>", { desc = "Definicion type" })
  key("n", "<leader>lf", ":Lspsaga finder<cr>", { desc = "Finder lsp" })
  key("n", "<leader>rn", ":Lspsaga rename<cr>", { desc = "Rename lsp" })

  if client.server_capabilities.inlayHintPorveder then
    vim.lsp.inlay_hint(bufnr, true)
  end
  filetype_attach[filetype](client, bufnr)
  require("tailwindcss-colors").buf_attach(bufnr)
end
