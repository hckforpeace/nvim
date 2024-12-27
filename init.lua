vim.g.mapleader = " "
vim.cmd("set number")
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {}) vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here

		-- color plugin
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },   -- add your plugins here

		-- FuzzyFinder
		{
			'nvim-telescope/telescope.nvim', tag = '0.1.8',
			-- or                              , branch = '0.1.x',
			dependencies = { 'nvim-lua/plenary.nvim' }
		},

		-- TreeSitter
		{ 
			"nvim-treesitter/nvim-treesitter", 
			build = ":TSUpdate",  -- This is more reliable than the current build function
		}
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	--  install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Telescope set up
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
    sync_install = false,        -- Install parsers synchronously (only applied to `ensure_installed`)
    auto_install = false,        -- Don't auto install if parser isn't installed
    highlight = { enable = true },
    indent = { enable = true },  
})
vim.cmd.colorscheme "catppuccin"
