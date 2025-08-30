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

					-- linters
					-- Prettier formatter
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.clang_format,
					require("none-ls.diagnostics.eslint"),
					require("none-ls.diagnostics.eslint_d"),
				},
			})
		end,
	},
	{
		"MunifTanjim/eslint.nvim",
		config = function()
			local eslint = require("eslint")
			eslint.setup({
				bin = "eslint", -- or `eslint_d`
				code_actions = {
					enable = true,
					apply_on_save = {
						enable = true,
						types = { "directive", "problem", "suggestion", "layout" },
					},
					disable_rule_comment = {
						enable = true,
						location = "separate_line", -- or `same_line`
					},
				},
				diagnostics = {
					enable = true,
					report_unused_disable_directives = false,
					run_on = "type", -- or `save`
				},
			})
		end,
	},
}
