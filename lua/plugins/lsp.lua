return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- lsp
					"lua-language-server",
					"clangd",
					"basedpyright",

					-- Formatters
					"stylua",
					"clang-format",
					-- "ruff",
					-- Linters
					"cpplint",
					"luacheck",
					"typescript-language-server", -- LSP
					"prettier", -- Formatter
					"prettierd",
					"eslint_d",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.config("lua_ls", {})
			vim.lsp.enable("lua_ls")
			vim.lsp.config("clangd", {})
			vim.lsp.enable("clangd")
			vim.lsp.config("basedpyright", {})
			vim.lsp.enable("basedpyright")
			vim.lsp.config("ruff", {})
			vim.lsp.enable("ruff")
			-- vim.lsp.config("ts_ls", {})
			-- vim.lsp.enable("ts_ls")
		end,
	},
}
