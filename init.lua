require("config.lazy")
vim.cmd.colorscheme "catppuccin"


-- Telescope set up
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
	sync_install = false,        -- Install parsers synchronously (only applied to `ensure_installed`)
	auto_install = false,        -- Don't auto install if parser isn't installed
	highlight = { enable = true },
	indent = { enable = true },  
})

-- Neo Tree 
vim.keymap.set('n', '<C-n>', ':Neotree right toggle<CR>')

