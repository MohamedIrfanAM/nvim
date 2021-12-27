local ls = require "luasnip"

local snippet = ls.snippet
local text = ls.text_node
local f = ls.function_node
local insert = ls.insert_node

ls.config.set_config {
  history = true,
  region_check_events = "CursorMoved,CursorHold,InsertEnter",
  delete_check_events = "InsertLeave",
  enable_autosnippets = true,
}
ls.config.setup({store_selection_keys="<Tab>"})

require("luasnip.loaders.from_vscode").load {
  paths = vim.fn.stdpath "config" .. "/snippets",
}
