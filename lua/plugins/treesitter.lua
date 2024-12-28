return(
	-- TreeSitter
	{ 
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",  -- This is more reliable than the current build function
		config = function() 
			-- treesitter
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
				sync_install = false,        -- Install parsers synchronously (only applied to `ensure_installed`)
				auto_install = false,        -- Don't auto install if parser isn't installed
				highlight = { enable = true },
				indent = { enable = true },  
			})

		end
	}
)
