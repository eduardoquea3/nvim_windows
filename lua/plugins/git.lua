return {
  "lewis6991/gitsigns.nvim",
  lazy = true,
  keys = {
    { "gj", "<cmd>Gitsigns next_hunk<cr>", desc = "Saltar al proximo cambio" },
    { "gk", "<cmd>Gitsigns prex_hunk<cr>", desc = "Saltar al anterior cambio" },
  },
  config = function ()
    local icon = require("eduardo.icons")
    require("gitsigns").setup({
      signs = {
        add = { text = icon.git.Add},
        change = { text = icon.git.Change},
        delete = { text = icon.git.Delete},
        topdelete = { text = icon.git.TopDelete},
        changedelete = { text = icon.git.ChangeDelete},
        untracked = { text = icon.git.Untracked},
      }
    })
  end
}
