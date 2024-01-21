return function(_, bufnr)
  local function map(mode, keymap, action, desc)
    vim.keymap.set(mode, keymap, action, { noremap = true, silent = true, desc = desc, buffer = bufnr })
  end

  map("n", "gd", vim.lsp.buf.definition, "Definicion")

  map("n", "K", vim.lsp.buf.hover, "Documentacion")

  map("n", "<leader>ca", vim.lsp.buf.code_action, "Code-Action")

  map("n", "<leader>sh", vim.lsp.buf.signature_help, "Signature Help")

  map("n", "<c-s>", function()
    vim.lsp.buf.format({ async = true })
    vim.notify("Formateando", { title = "Null-ls" })
  end, "Format on save")

  map("n", "<leader>oo", ":SymbolsOutline<cr>", "Outline")

  map("n", "<leader>lf", ":Telescope lsp_references<cr>", "Finder lsp")

  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename lsp")

  map("n", "dn", vim.diagnostic.goto_prev, "Saltar al anterior")

  map("n", "dp", vim.diagnostic.goto_next, "Saltar al siguiente")

  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
  --   buffer = bufnr,
  --   callback = function()
  --     vim.lsp.buf.format()
  --     vim.notify("Formateando", { title = "Null-ls" })
  --   end,
  -- })

  -- vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
end
