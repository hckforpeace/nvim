return {
  "nvim-neo-tree/neo-tree.nvim",
  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  },
  d_file = {
    enable = true,
    update_root = true, -- optional but useful
  },
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- Optional image support for file preview: See `# Preview Mode` for more information.
    -- {"3rd/image.nvim", opts = {}},
    -- OR use snacks.nvim's image module:
    -- "folke/snacks.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    window = {
      mappings = {
        ["l"] = "open_with_window_picker", -- Use 'l' to open
        ["h"] = "close_node",          -- Use 'h' to close
        ["<C-v>"] = "open_vsplit",     -- Use 'h' to close
        ["<C-h>"] = "open_split",      -- Use 'h' to close
      },
    },
  },
}
