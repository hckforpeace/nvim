return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		config = function()
			require("mason-lspconfig").setup(
				{
					ensure_installed = { "lua_ls", "rust_analyzer" }
					local lsconfig = require("lspconfig")
					lspconfig.lua_ls.setup({})
				})
		end
	}
}
