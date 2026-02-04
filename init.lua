require("config.lazy")
require("config.keymaps")

-- Configure how diagnostics are displayed
vim.diagnostic.config({
	virtual_text = true, -- Show errors as virtual text at end of line
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	underline = true,  -- Underline problematic code
	update_in_insert = false, -- Don't update diagnostics while typing
	severity_sort = true, -- Sort diagnostics by severity
})

-- Diagnostic filtering commands
-- Toggle diagnostics on/off
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
  local current = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not current)
  print(current and "Diagnostics disabled" or "Diagnostics enabled")
end, {})

-- Show only errors (hide warnings, hints, info)
vim.api.nvim_create_user_command("DiagnosticsErrorsOnly", function()
  vim.diagnostic.config({
    virtual_text = { severity = { min = vim.diagnostic.severity.ERROR } },
    signs = { severity = { min = vim.diagnostic.severity.ERROR } },
    underline = { severity = { min = vim.diagnostic.severity.ERROR } },
  })
  print("Showing only errors")
end, {})

-- Show errors and warnings (hide hints, info)
vim.api.nvim_create_user_command("DiagnosticsErrorsWarnings", function()
  vim.diagnostic.config({
    virtual_text = { severity = { min = vim.diagnostic.severity.WARN } },
    signs = { severity = { min = vim.diagnostic.severity.WARN } },
    underline = { severity = { min = vim.diagnostic.severity.WARN } },
  })
  print("Showing errors and warnings")
end, {})

-- Show all diagnostics (reset to default)
vim.api.nvim_create_user_command("DiagnosticsAll", function()
  vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
  })
  print("Showing all diagnostics")
end, {})

-- Hide virtual text but keep signs and underlines
vim.api.nvim_create_user_command("DiagnosticsHideVirtualText", function()
  vim.diagnostic.config({ virtual_text = false })
  print("Virtual text hidden")
end, {})

-- Show virtual text
vim.api.nvim_create_user_command("DiagnosticsShowVirtualText", function()
  vim.diagnostic.config({ virtual_text = true })
  print("Virtual text shown")
end, {})

-- Custom: set minimum severity level (takes argument: ERROR, WARN, INFO, HINT)
vim.api.nvim_create_user_command("DiagnosticsSetLevel", function(opts)
  local level = opts.args:upper()
  local severity_map = {
    ERROR = vim.diagnostic.severity.ERROR,
    WARN = vim.diagnostic.severity.WARN,
    INFO = vim.diagnostic.severity.INFO,
    HINT = vim.diagnostic.severity.HINT,
  }
  
  local severity = severity_map[level]
  if severity then
    vim.diagnostic.config({
      virtual_text = { severity = { min = severity } },
      signs = { severity = { min = severity } },
      underline = { severity = { min = severity } },
    })
    print("Showing diagnostics >= " .. level)
  else
    print("Invalid level. Use: ERROR, WARN, INFO, or HINT")
  end
end, { nargs = 1 })

-- to copy
vim.opt.clipboard = "unnamedplus"
-- tab size
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
--fold
vim.opt.foldmethod = "indent"  -- or "syntax" or "expr"
vim.opt.foldlevel = 99         -- open all folds by default
