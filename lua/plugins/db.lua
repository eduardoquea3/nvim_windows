return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },
    },
    "tpope/vim-dotenv",
  },
  keys = { { "<leader><leader>db", ":tab DBUI<cr>", desc = "Open Database client" } },
  init = function()
    vim.g.db_ui_use_nvim_notify = 1
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 1
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_winwidth = 20
    vim.g.db_ui_save_location = "E:/sql"

    vim.g.db_ui_icons = {
      expanded = {
        db = "▾ ",
        buffers = "▾ ",
        saved_queries = "▾ ",
        schemas = "▾ ",
        schema = "▾ ",
        tables = "▾ 󱋣",
        table = "▾ ",
      },
      collapsed = {
        db = "▸ ",
        buffers = "▸ ",
        saved_queries = "▸ ",
        schemas = "▸ ",
        schema = "▸ ",
        tables = "▸ 󱋣",
        table = "▸ ",
      },
      saved_query = "",
      new_query = "",
      tables = "󱋣",
      buffers = "",
      add_connection = "",
      connection_ok = "",
      connection_error = "",
    }
  end,
}
