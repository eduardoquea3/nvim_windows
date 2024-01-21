local cmp = require("cmp")
local icon = require("eduardo.icons")
local luasnip = require("luasnip")
local window = cmp.config.window.bordered({
  -- winhighlihgt = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
  winhighlihgt = "Normal:Pmenu,FloatBorder:Pmenu,Search:Nome",
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = "menuone,noselect,noinsert",
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-n>"] = cmp.mapping.complete(),
    ["<c-y>"] = cmp.mapping.confirm({ select = true }),
    ["<c-space>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  window = {
    completion = window,
    documentation = window,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "nvim_lua" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    { name = "nerdfonts" },
  },
  experimental = {
    native_menu = false,
    ghost_text = false,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, item)
      if item.kind == "Color" then
        item = require("cmp-tailwind-colors").format(entry, item)

        if item.kind ~= "Color" then
          item.menu = "Color"
          return item
        end
      end
      item.menu = item.kind
      item.kind = icon.kind[item.kind] .. " "
      return item
    end,
  },
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
