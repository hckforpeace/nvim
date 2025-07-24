vim.cmd("set relativenumber")

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Move to right window" })

-- Quit all
vim.keymap.set("n", "<leader>qq", "<cmd>qall<CR>", { desc = "Quit all" })
-- Save buffer
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Quit all" }) 

-- Setting color Scheme
vim.cmd("colorscheme nightfox")

-- Fuzy Finder
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find file" }) 
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Search/Grep a word in files" }) 

-- LSP keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- Go To definition
vim.keymap.set("n", "rn", vim.lsp.buf.rename, {}) -- Renames all references to the symbol under the cursor.
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {}) -- Renames all references to the symbol under the cursor.

-- Buffer Navigation
vim.keymap.set("n", "<leader>bb", "<cmd>bprevious<cr>", {})
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", {})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
