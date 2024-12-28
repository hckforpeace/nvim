-- Lualine You can see it at the bottom of the window
return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config  = function()
			require('lualine').setup({
			options = { theme = 'gruvbox' }})
		end
	}
}
