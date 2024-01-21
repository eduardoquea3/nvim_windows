return {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = {
    { "ff", mode = { "n", "v" }, desc = "Comment line" },
    { "gb", mode = { "n", "v" }, desc = "Comment block" },
  },
  config = function()
    require("Comment").setup({
      toggler = {
        line = "ff",
        block = "gb",
      },
      opleader = {
        line = "ff",
        block = "gb",
      },
    })
  end,
}
