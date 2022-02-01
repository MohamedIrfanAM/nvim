local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local servers = {
  "sumneko_lua",
  "clangd",
  "texlab"
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("user.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "clangd" then
	 	local clangd_opts = require("user.lsp.settings.clangd")
	 	opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	 end

	 if server.name == "texlab" then
	 	local texlab_opts= require("user.lsp.settings.texlab")
	 	opts = vim.tbl_deep_extend("force", texlab_opts, opts)
	 end

	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)

