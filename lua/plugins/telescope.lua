return {
  "nvim-telescope/telescope.nvim",
  version = false,
  lazy = true,
  -- event = "VeryLazy",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/popup.nvim",
    {
      "nvim-lua/plenary.nvim",
      cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" },
    },
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Find Word",
    },
    {
      "<leader>fo",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Find Recent",
    },
    {
      "<leader>fB",
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "Builtin",
    },
    {
      "<leader>fb",
      function()
        require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
      end,
      desc = "File browser",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Find Diagnostics",
    },
    {
      "<leader>fp",
      function()
        require("telescope").extensions.project.project()
      end,
      desc = "Find Diagnostics",
    },
    {
      "<leader>fn",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "Find Diagnostics",
    },
  },
  config = function()
    local icon = require("eduardo.icons")
    local actions = require("telescope.actions")
    require("telescope").setup({
      enabled = true,
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "bin",
          ".git",
          "packages",
          "obj",
        },
        mappings = {
          n = {
            ["q"] = actions.close,
          },
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.close,
            ["<C-e>"] = actions.select_default,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        path_display = { "smart" },
        prompt_prefix = icon.ui.Telescope .. "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          hidden = true,
          theme = "ivy",
        },
      },
      extensions = {
        file_browser = {
          mappings = {
            ["i"] = {
              ["<C-w>"] = false,
              ["<C-h>"] = false,
            },
          },
          theme = "dropdown",
          hidden = true,
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      },
    })
    require("telescope").load_extension("project")
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("notify")
  end,
}
