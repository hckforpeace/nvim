vim.cmd("set relativenumber")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right window" })

-- Quit all
vim.keymap.set("n", "<leader>qq", "<cmd>qall<CR>", { desc = "Quit all" })
-- Save buffer
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save current buffer" })
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>", { desc = "Delete buffer" })
-- Setting color Scheme
vim.cmd("colorscheme gruvbox")

-- Fuzy Finder
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find file" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search/Grep a word in files" })

-- LSP keymaps
vim.keymap.set("n", "gi", function()
	require("telescope.builtin").lsp_implementations()
end, { desc = "Go to implementation" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- Go To definition
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {}) -- Go To definition
vim.keymap.set("n", "gr", vim.lsp.buf.references, {}) -- Go To definition
vim.keymap.set("n", "rn", vim.lsp.buf.rename, {}) -- Renames all references to the symbol under the cursor.
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- Renames all references to the symbol under the cursor.

-- Buffer Navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", {})
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Open a file with its diff (vs HEAD) in a right split. Called from lazygit.
vim.api.nvim_create_user_command("GitDiffSplit", function(opts)
	local file = vim.fn.fnamemodify(opts.args, ":p")
	local dir = vim.fn.fnamemodify(file, ":h")
	local root = vim.fn.systemlist({ "git", "-C", dir, "rev-parse", "--show-toplevel" })[1]
	if vim.v.shell_error ~= 0 or not root then
		vim.notify("Not a git repo: " .. file, vim.log.levels.ERROR)
		return
	end
	local rel = file:sub(#root + 2)
	local head = vim.fn.systemlist({ "git", "-C", dir, "show", "HEAD:" .. rel })
	if vim.v.shell_error ~= 0 then
		head = {} -- new/untracked file: diff against empty
	end

	vim.cmd("edit " .. vim.fn.fnameescape(file))
	vim.cmd("diffthis")
	local ft = vim.bo.filetype
	vim.cmd("rightbelow vnew")
	vim.api.nvim_buf_set_lines(0, 0, -1, false, head)
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
	vim.bo.filetype = ft
	vim.cmd("diffthis")
	vim.api.nvim_buf_set_name(0, rel .. " (HEAD)")
	vim.cmd("wincmd p") -- focus back on the editable file
end, { nargs = 1, desc = "Open file with diff vs HEAD in right split" })

-- Flutter Dev
-- vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", { desc = "Start Flutter" })
-- vim.keymap.set("n", "<leader>fq", "<cmd>FlutterQuit<cr>", { desc = "Stop Flutter" })
