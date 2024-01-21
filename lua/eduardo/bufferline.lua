local bufferline = require("bufferline")
bufferline.setup({
  options = {
    indicator = {
      icon = "▎",
      style = "icon",
    },
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, _, _, _)
      return "(" .. count .. ")"
    end,
    custom_filter = function(buf_number, buf_numbers)
      if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
        return true
      end
      if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
        return true
      end
      if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
        return true
      end
      if buf_numbers[1] ~= buf_number then
        return true
      end
    end,
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        highlight = "Directory",
        separator = true,
      },
    },
    -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
  },
})
