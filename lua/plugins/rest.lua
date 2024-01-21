return {
  "rest-nvim/rest.nvim",
  ft = { "http" },
  dependencies = { { "nvim-lua/plenary.nvim" } },
  opts = {
    result = {
      show_http_info = false,
      show_headers = false,
      show_statistics = false,
      formatters = {
        json = "jq",
        html = function(body)
          return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
        end,
      },
    },
  },
  config = function()
    local function map(mode, keymap, action, desc)
      vim.keymap.set(mode, keymap, action, { noremap = true, silent = true, desc = desc })
    end
    local rest_nvim = require("rest-nvim")
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "http",
      callback = function()
        map("n", "<leader>hn", rest_nvim.run, "Run near http request")
        map("n", "<leader>hl", rest_nvim.last, "Run last http resquest")
        map("n", "<leader>hp", function()
          rest_nvim.run(true)
        end, "Preview http curl")
      end,
    })
  end,
}
