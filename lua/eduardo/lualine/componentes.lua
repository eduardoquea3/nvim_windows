local icon = require("eduardo.icons")
local color = require("eduardo.lualine.colors").colors
local mode_color = require("eduardo.lualine.mode_color").mode_color
local back = color.bg_tokyo

function hide()
  return vim.o.columns > 80
end

function tinte()
  return { fg = mode_color[vim.fn.mode()], bg = back }
end

return {
  left = {
    function()
      return "▊"
    end,
    color = tinte,
    padding = { left = 0, right = 0 },
    cond = nil,
  },
  right = {
    function()
      return "▊"
    end,
    color = tinte,
    padding = { left = 0, right = 0 },
    cond = nil,
  },
  branch = {
    "b:gitsigns_head",
    icon = icon.git.Branch,
    color = { gui = "bold", bg = back },
  },
  filename = {
    "filename",
    color = {},
    cond = nil,
  },
  diff = {
    "diff",
    symbols = {
      added = icon.git.LineAdded .. " ",
      modified = icon.git.LineModified .. " ",
      removed = icon.git.LineRemoved .. " ",
    },
    padding = { left = 1, right = 1 },
    diff_color = {
      added = { fg = "#43b933" },
      modified = { fg = "#0180cc" },
      removed = { fg = "#b32817" },
    },
    cond = nil,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = {
      error = icon.diagnostics.BoldError .. " ",
      warn = icon.diagnostics.BoldWarning .. " ",
      info = icon.diagnostics.BoldInformation .. " ",
      hint = icon.diagnostics.BoldHint .. " ",
    },
    color = { bg = back },
    -- cond = conditions.hide_in_width,
  },
  lsp = {
    function()
      local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      local formatters = require("eduardo.lualine.null_ls")
      local supported_formatters = formatters.list_formater(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      local linters = require("eduardo.lualine.null_ls")
      local supported_linters = linters.list_linter(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      local unique_client_names = vim.fn.uniq(buf_client_names)

      local language_servers = "" .. table.concat(unique_client_names, ", ") .. ""

      return language_servers
    end,
    color = { bg = back, fg = "#ffffff", gui = "bold" },
    cond = hide,
  },
  treesitter = {
    function()
      return icon.ui.Target .. " TS"
    end,
    color = function()
      local buf = vim.api.nvim_get_current_buf()
      local ts = vim.treesitter.highlighter.active[buf]
      return { fg = ts and not vim.tbl_isempty(ts) and "#88ffb3" or "#d96c6f", bg = back }
    end,
    separator = { right = "" },
  },
  location = {
    "location",
    padding = { left = 1, right = 1 },
    color = { fg = "#ffffff", bg = back },
  },
  separator = {
    function()
      return "|"
    end,
    color = { fg = "#ffffff", bg = back },
  },
  progress = {
    "progress",
    fmt = function()
      return "%P/%L"
    end,
    color = {},
  },
  spaces = {
    function()
      local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
      return icon.ui.Tab .. " " .. shiftwidth
    end,
    padding = 1,
    color = { fg = "white", bg = back },
  },
  encoding = {
    "o:encoding",
    fmt = string.upper,
    color = {},
    cond = hide,
  },
  filetype = { "filetype", cond = nil, padding = { left = 0, right = 1 } },
  scrollbar = {
    function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    padding = { left = 0, right = 0 },
    color = "SLProgress",
    cond = nil,
  },
  macro = {
    function()
      local use = vim.fn.reg_recording()
      if use ~= "" then
        return icon.ui.Telescope .. " " .. use
      end
      return ""
    end,
    color = { fg = "white", bg = back },
    -- cond = vim.fn.reg_recording() ~= "",
  },
}
