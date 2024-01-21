local icon = require("eduardo.icons")

require("window-picker").setup({
  autoselect_one = true,
  include_current = false,
  filter_rules = {
    bo = {
      filetype = { "neo-tree", "neo-tree-popup", "notify" },
      buftype = { "terminal", "quickfix" },
    },
  },
  other_win_hl_color = "#e35e4f",
})

vim.fn.sign_define("DiagnosticSignError", { text = icon.diagnostics.BoldError, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = icon.diagnostics.BoldWarning, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = icon.diagnostics.BoldInformation, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = icon.diagnostics.BoldHint, texthl = "DiagnosticSignHint" })

vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { ctermbg = 0, fg = "#eebb7b" })

require("neo-tree").setup({
  close_if_last_window = false,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  enable_normal_mode_for_inputs = false,
  open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = icon.ui.Folder,
      folder_open = icon.ui.FolderOpen,
      folder_empty = icon.ui.EmptyFolder,
      default = "*",
      highlight = "#eebb7b",
    },
    modified = {
      symbol = icon.git.LineModified,
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        added = icon.git.LineAdded,
        modified = icon.git.LineModified,
        deleted = icon.git.FileDeleted,
        renamed = icon.git.FileRenamed,
        untracked = icon.git.FileUntracked,
        ignored = icon.git.FileIgnored,
        unstaged = icon.git.FileUnstaged,
        staged = icon.git.FileStaged,
        conflict = icon.git.FileUnmerged,
      },
    },
    file_size = {
      enabled = false,
      required_width = 64,
    },
    type = {
      enabled = false,
      required_width = 122,
    },
    last_modified = {
      enabled = false,
      required_width = 88,
    },
    created = {
      enabled = false,
      required_width = 110,
    },
    symlink_target = {
      enabled = false,
    },
  },
  commands = {},
  window = {
    position = "right",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<leader>"] = {
        "toggle_node",
        nowait = false,
      },
      ["l"] = "open",
      ["h"] = "open",
      ["<esc>"] = "revert_preview",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["l"] = "open_tabnew",
      ["w"] = "open_with_window_picker",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      ["a"] = {
        "add",
        config = {
          show_path = "none",
        },
      },
      ["A"] = "add_directory",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy",
      ["m"] = "move",
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<S-Tab>"] = "prev_source",
      ["<Tab>"] = "next_source",
    },
  },
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
      hide_by_name = {},
      hide_by_pattern = {},
      always_show = {},
      never_show = {},
      never_show_by_pattern = {},
    },
    follow_current_file = {},
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = false,
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["#"] = "fuzzy_sorter",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
        ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
        ["oc"] = { "order_by_created", nowait = false },
        ["od"] = { "order_by_diagnostics", nowait = false },
        ["og"] = { "order_by_git_status", nowait = false },
        ["om"] = { "order_by_modified", nowait = false },
        ["on"] = { "order_by_name", nowait = false },
        ["os"] = { "order_by_size", nowait = false },
        ["ot"] = { "order_by_type", nowait = false },
      },
      fuzzy_finder_mappings = {
        ["<down>"] = "move_cursor_down",
        ["<C-n>"] = "move_cursor_down",
        ["<up>"] = "move_cursor_up",
        ["<C-p>"] = "move_cursor_up",
      },
    },
  },
  buffers = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
    group_empty_dirs = true,
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"] = "buffer_delete",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
        ["oc"] = { "order_by_created", nowait = false },
        ["od"] = { "order_by_diagnostics", nowait = false },
        ["om"] = { "order_by_modified", nowait = false },
        ["on"] = { "order_by_name", nowait = false },
        ["os"] = { "order_by_size", nowait = false },
        ["ot"] = { "order_by_type", nowait = false },
      },
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
        ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
        ["oc"] = { "order_by_created", nowait = false },
        ["od"] = { "order_by_diagnostics", nowait = false },
        ["om"] = { "order_by_modified", nowait = false },
        ["on"] = { "order_by_name", nowait = false },
        ["os"] = { "order_by_size", nowait = false },
        ["ot"] = { "order_by_type", nowait = false },
      },
    },
  },
})
