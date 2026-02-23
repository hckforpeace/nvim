return {

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"s1n7ax/nvim-window-picker",
		},
		config = function()
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			local function pick_window_open(prompt_bufnr)
				local entry = action_state.get_selected_entry()
				if not entry then
					return
				end

				local wins = vim.api.nvim_tabpage_list_wins(0)
				local normal_wins = vim.tbl_filter(function(win)
					local buf = vim.api.nvim_win_get_buf(win)
					return vim.bo[buf].buftype == ""
				end, wins)

				actions.close(prompt_bufnr)

				if #normal_wins > 1 then
					local picked = require("window-picker").pick_window()
					if picked then
						vim.api.nvim_set_current_win(picked)
					end
				end

				if entry.path or entry.filename then
					vim.cmd("edit " .. vim.fn.fnameescape(entry.path or entry.filename))
				elseif entry.bufnr then
					vim.api.nvim_set_current_buf(entry.bufnr)
				end
			end

			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<CR>"] = pick_window_open,
						},
						n = {
							["<CR>"] = pick_window_open,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
