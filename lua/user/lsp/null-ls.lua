local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover

null_ls.setup({
	debug = false,
	sources = {
		formatting.stylua,
    diagnostics.cppcheck.with({
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        extra_args = {"--suppress=unusedVariable","--suppress=variableScope","--suppress=constVariable"},
    }),
    formatting.codespell.with({filetypes = {'tex','markdown'}}),
    hover.dictionary.with({filetypes = {'tex','markdown'}}),
	},
})
