return{
  "rmagatti/alternate-toggler",
  keys = { { "<leader>i", "<cmd>lua require('alternate-toggler').toggleAlternate()<cr>", desc = "Toggle Boolean" } },
  config = function ()
    require("alternate-toggler").setup({
      alternates = {
        ["=="]="!="
      }
    })
  end,
  lazy = true,
}
