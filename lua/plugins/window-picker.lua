return {
  "s1n7ax/nvim-window-picker",
  version = "2.*",
  opts = {
    hint = "statusline-winbar",
    selection_chars = "HJKL",
    filter_rules = {
      bo = {
        filetype = { "NvimTree", "notify" },
        buftype = { "terminal", "quickfix" },
      },
    },
  },
}
