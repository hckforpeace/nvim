return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- formatters
					-- Lua
					null_ls.builtins.formatting.stylua,

					-- Lua linter
					null_ls.builtins.diagnostics.luacheck,

					-- linters
					-- Prettier formatter
					null_ls.builtins.formatting.google_java_format,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.clang_format,
				},
			})
		end,
	},
}
