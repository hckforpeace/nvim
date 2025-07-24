require("config.lazy")
require("config.keymaps")

-- Configure how diagnostics are displayed
vim.diagnostic.config({
	virtual_text = true, -- Show errors as virtual text at end of line
	signs = true,      -- Show signs in the gutter
	underline = true,  -- Underline problematic code
	update_in_insert = false, -- Don't update diagnostics while typing
	severity_sort = true, -- Sort diagnostics by severity
})

-- Optional: Configure diagnostic signs
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
