require 'config.options'
vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('LazyVim', { clear = true }),
  pattern = 'VeryLazy',
  callback = function()
    -- require 'config.autocmds'
    require 'config.diagnostic'
  end
})
require 'config.lazy'
local auto = require("config.autocmd")
auto.load_defaults()
