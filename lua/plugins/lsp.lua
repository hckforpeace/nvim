return {
	-- Installs all the lsp's 
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	-- bridges the lsp and neovim
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				-- add here the language
				ensure_installed = { "lua_ls", "clangd" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		-- to remove the global variable error 
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		-- Making conection with the lsp's ...
		config = function()
			require("lspconfig").lua_ls.setup {}
			require("lspconfig").clangd.setup {}

		end,
	}
--[[	,{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
        			null_ls.builtins.formatting.stylua,
        			--require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    			},
			})
		end
	} --]]
}
