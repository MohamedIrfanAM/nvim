local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local servers = {
  "sumneko_lua",
  "clangd",
  "texlab",
  "ltex",
}

mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }
	 if server == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server == "clangd" then
	 	local clangd_opts = require("user.lsp.settings.clangd")
	 	opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	 end

	 if server == "texlab" then
	 	local texlab_opts= require("user.lsp.settings.texlab")
	 	opts = vim.tbl_deep_extend("force", texlab_opts, opts)
	 end
  lspconfig[server].setup(opts)
end
