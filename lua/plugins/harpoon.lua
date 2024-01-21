return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  lazy = true,
  keys = {
    { "<leader>s", desc = "Harpoon" },
    {
      "<leader>ss",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
      desc = "Harpoon Menu",
    },
    {
      "<leader>sa",
      function()
        require("harpoon"):list():append()
      end,
      desc = "Harpoon add file",
    },
    {
      "<leader>su",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon go to file 1",
    },
    {
      "<leader>si",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon go to file 2",
    },
    {
      "<leader>sj",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon go to file 3",
    },
    {
      "<leader>sk",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon go to file 4",
    },
    {
      "<leader>sl",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "Harpoon go to file 5",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
  },
  opts = {},
}
