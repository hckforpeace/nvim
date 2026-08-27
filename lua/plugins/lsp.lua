return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- lsp
          "lua-language-server",
          "clangd",
          "golangci-lint-langserver",
          "golangci-lint", -- the linter binary the langserver shells out to
          "gopls",

          -- Python
          "basedpyright",

          -- Formatters
          "stylua",
          "clang-format",
          -- Python
          "ruff",
          -- Linters
          -- "cpplint",
          -- "luacheck",
          "typescript-language-server", -- LSP
          "prettier",              -- Formatter
          -- "prettierd",
          -- "eslint_d",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {})
      vim.lsp.enable("lua_ls")
      vim.lsp.config("clangd", {})
      vim.lsp.enable("clangd")
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = true, -- 👈 uses gofumpt instead of gofmt
          },
        },
      })
      vim.lsp.enable("gopls")
      vim.lsp.config("golangci_lint_ls", {})
      vim.lsp.enable("golangci_lint_ls")

      -- Python
      -- basedpyright: types + completion. Unused-import/variable are left to ruff.
      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              diagnosticSeverityOverrides = {
                reportUnusedImport = "none",
                reportUnusedVariable = "none",
              },
            },
          },
        },
      })
      vim.lsp.enable("basedpyright")
      -- ruff: lint + format. Hover is disabled so basedpyright owns it.
      vim.lsp.config("ruff", {
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      })
      vim.lsp.enable("ruff")

      -- vim.lsp.config("ts_ls", {})
      -- vim.lsp.enable("ts_ls")
      -- vimvim.lsp.config("ts_ls", {
      -- vim.lsp.enable("prettier"			-- TypeScript/JavaScript LSP
      vim.lsp.config("ts_ls", {
        filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      })
      vim.lsp.enable("ts_ls")
    end,
  },
}
