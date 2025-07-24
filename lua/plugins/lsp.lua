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

					-- Formatters
					"stylua",
					"clang-format",
					-- Linters
					"cpplint",
					"luacheck",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			-- Clangd
			lspconfig.clangd.setup({
				cmd = { "clangd", "--background-index" }, -- optional
				filetypes = { "c", "cpp", "objc", "objcpp" },
			})
		end,
	},
}
