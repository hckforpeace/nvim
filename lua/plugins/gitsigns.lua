return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	keys = {
		{ "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Diff vs HEAD" },
		{ "<leader>gD", "<cmd>Gitsigns diffthis ~<cr>", desc = "Diff vs HEAD~" },
		{ "<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
		{ "<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", desc = "Stage hunk" },
		{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
		{ "]h", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
		{ "[h", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
	},
}
