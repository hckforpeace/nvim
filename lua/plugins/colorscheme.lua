-- color plugin
return {
	{"catppuccin/nvim", 
		name = "catppuccin", 
		priority = 1000, 
		config = function() -- add your plugins here
vim.cmd.colorscheme "catppuccin"
		end}
}

