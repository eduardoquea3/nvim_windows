local opts = {
  mode = "n",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local mappings = {
  ["<C-a>"] = { "zo", "Abrir pliege" },
  ["<C-c>"] = { "zc", "Cerrar pliege" },
  ["<S-Tab>"] = { ":bprevious<cr>", "Tabular atras" },
  ["<Tab>"] = { ":bnext<cr>", "Tabular" },
  ["<C-h>"] = { "<C-w>h", "Movements" },
  ["<C-j>"] = { "<C-w>j", "Movements" },
  ["<C-k>"] = { "<C-w>k", "Movements" },
  ["<C-l>"] = { "<C-w>l", "Movements" },
  ["<C-m>"] = { require("ufo").peekFoldedLinesUnderCursor, "Previsualizar pliegue" },
  ["<A-j>"] = { ":m .+1<cr>==", "Mover abajo linea" },
  ["<A-k>"] = { ":m .-2<cr>==", "Mover arriba linea" },
  ["<A-a>"] = { "ggVG", "select all" },
  ["<right>"] = { "", "No use" },
  ["<left>"] = { "", "No use" },
  ["<down>"] = { "", "No use" },
  ["<up>"] = { "", "No use" },
  ["K"] = { "<cmd>resize +2<cr>", "Resize horizontal ++" },
  ["J"] = { "<cmd>resize -2<cr>", "Resize horizontal --" },
  ["H"] = { "<cmd>vertical resize -2<cr>", "Resize vertical --" },
  ["L"] = { "<cmd>vertical resize +2<cr>", "Resize vertical ++" },
  ["sv"] = { "<cmd>vsplit<cr>", "Vertical split" },
  ["ss"] = { "<cmd>split<cr>", "Split" },
}

local lopts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local lmappings = {
  e = { ":Neotree float toggle<cr>", "Abrir neotree" },
  a = { ":WhichKey<cr>", "Mostrar atajos" },
  r = {
    r = { ":luafile %<cr>", "Actualizar config" },
  },
  q = { ":confirm qall<cr>", "Cerrar neovim" },
  w = { ":w<cr>", "Guardar archivo" },
  b = {
    name = "buffer",
    d = { "<cmd>bdelete<cr>", "Eliminar buffer" },
    s = { "<c-w>q", "Cerrar split" },
  },
  l = {
    name = "Lazy",
    l = { "<cmd>Lazy<cr>", "Lazy" },
    i = { "<cmd>Lazy install<cr>", "Lazy install" },
    u = { "<cmd>Lazy update<cr>", "Lazy update" },
    c = { "<cmd>Lazy clean<cr>", "Lazy clean" },
  },
}

local topts = {
  mode = "t",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local tmappings = {
  ["<Esc>"] = { "<C-\\><C-n>", "Modo normal terminal" },
}

local vopts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local vmappings = {
  ["<c-l>"] = { "<Esc>", "Modo Normal" },
}

local iopts = {
  mode = "i",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local imappings = {
  ["<A-h>"] = { "<left>", "Movements" },
  ["<A-j>"] = { "<down>", "Movements" },
  ["<A-k>"] = { "<up>", "Movements" },
  ["<A-l>"] = { "<right>", "Movements" },
  ["<C-b>"] = { "<C-left>", "Movements" },
  ["<C-e>"] = { "<C-right>", "Movements" },
  ["<C-j>"] = { "<Esc><cmd>m .+1<cr>==i", "Mover abajo linea" },
  -- ["jk"] = { "<Esc>", "Mode Normal" },
  -- ["kj"] = { "<Esc>", "Mode Normal" },
  ["<C-,>"] = { "<Esc>", "Mode Normal" },
  ["<C-k>"] = { "<Esc><cmd>m .-2<cr>==i", "Mover arriba linea" },
  -- ["<C-h>"] = { "<BS>", "Delete char prev" },
  ["<C-l>"] = { "<Del>", "Delete char next" },
  ["<right>"] = { "", "No use" },
  ["<left>"] = { "", "No use" },
  ["<down>"] = { "", "No use" },
  ["<up>"] = { "", "No use" },
}

local copts = {
  mode = "c",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local cmappings = {
  ["<C-l>"] = { "<Esc>", "Modo Normal" },
}

local which_key = require("which-key")

which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(tmappings, topts)
which_key.register(imappings, iopts)
which_key.register(lmappings, lopts)
which_key.register(cmappings, copts)
