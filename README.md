# Neovim Configuration

A personal, modular [Neovim](https://neovim.io) configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim). It ships a curated set of plugins for LSP, completion, fuzzy finding, Git, AI assistants, and language tooling — with one plugin per file for easy tinkering.

> [!NOTE]
> This is a config repository, not a Lua library. There is no build step or test suite — clone it into your Neovim config directory and open Neovim.

## Features

- **Plugin management** with [lazy.nvim](https://github.com/folke/lazy.nvim), bootstrapped automatically on first launch.
- **LSP** via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [Mason](https://github.com/williamboman/mason.nvim), with servers and tools auto-installed (`lua_ls`, `clangd`, `gopls`, `golangci-lint`, `ts_ls`).
- **Autocompletion** with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [LuaSnip](https://github.com/L3MON4D3/LuaSnip) (LSP, buffer, path, and cmdline sources).
- **Syntax & parsing** with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter), including large-file highlight throttling.
- **Fuzzy finding** with [Telescope](https://github.com/nvim-telescope/telescope.nvim), wired to a window picker so results open in the split you choose.
- **File explorer** with [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim).
- **Formatting & linting** with [none-ls](https://github.com/nvimtools/none-ls.nvim) (`stylua`, `prettier`, `clang-format`, `luacheck`).
- **AI assistants**: [claudecode.nvim](https://github.com/coder/claudecode.nvim) and [opencode.nvim](https://github.com/NickvanDyke/opencode.nvim).
- **Navigation & motions**: [flash.nvim](https://github.com/folke/flash.nvim), [bufferline](https://github.com/akinsho/bufferline.nvim), [window-picker](https://github.com/s1n7ax/nvim-window-picker).
- **Git** inline blame with [git-blame.nvim](https://github.com/f-person/git-blame.nvim).
- **Language extras**: [flutter-tools](https://github.com/nvim-flutter/flutter-tools.nvim) and a [neotest](https://github.com/nvim-neotest/neotest) base for test running.
- **UI**: [gruvbox](https://github.com/ellisonleao/gruvbox.nvim) colorscheme, [lualine](https://github.com/nvim-lualine/lualine.nvim) statusline, and devicons.
- **Quality of life**: auto-pairs, comment toggling, code folding ([nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)), system clipboard integration, and auto-reload of files changed on disk.

## Requirements

- **Neovim 0.11+** — the LSP setup uses the `vim.lsp.config()` / `vim.lsp.enable()` API.
- **Git** — for bootstrapping plugins and inline blame.
- A terminal with a [Nerd Font](https://www.nerdfonts.com) for icons.
- Optional, depending on the languages you edit:
  - Go, C/C++, Lua, TypeScript/JavaScript toolchains (LSP servers are installed via Mason).
  - The [Flutter](https://flutter.dev) SDK for `flutter-tools`.

## Getting started

> [!WARNING]
> This replaces your existing Neovim configuration. Back up `~/.config/nvim` first if you have one.

1. Clone the repository into your Neovim config directory:

   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

2. Launch Neovim. On first start, lazy.nvim bootstraps itself and installs every plugin:

   ```bash
   nvim
   ```

3. Wait for Mason to finish installing the LSP servers and formatters, then restart Neovim.

## Project structure

```
.
├── init.lua                 # Entry point: loads config, diagnostics, editor options
├── lazy-lock.json           # Pinned plugin versions
└── lua/
    ├── config/
    │   ├── lazy.lua         # lazy.nvim bootstrap and setup
    │   └── keymaps.lua      # Global keymaps and colorscheme
    └── plugins/             # One file per plugin spec
        ├── lsp.lua          # Mason + lspconfig
        ├── nvim-comp.lua    # Completion (nvim-cmp)
        ├── telescope.lua    # Fuzzy finder
        ├── treesitter.lua   # Syntax parsing
        ├── nvim-tree.lua    # neo-tree file explorer
        ├── none-ls.lua      # Formatters & linters
        ├── claude.lua       # Claude Code integration
        ├── opencode.lua     # opencode integration
        └── ...
```

Each file in `lua/plugins/` returns a lazy.nvim plugin spec and is imported automatically — add a new file to add a plugin.

## Keymaps

The leader key is `<Space>`.

### General

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>w`  | Save current buffer     |
| `<leader>d`  | Delete buffer           |
| `<leader>qq` | Quit all                |
| `<C-h/j/k/l>`| Move between windows    |
| `<S-h>`      | Previous buffer         |
| `<S-l>`      | Next buffer             |

### Find & navigate

| Key          | Action                       |
| ------------ | ---------------------------- |
| `<leader>ff` | Find files (Telescope)       |
| `<leader>fg` | Live grep (Telescope)        |
| `<leader>e`  | Toggle neo-tree explorer     |
| `s` / `S`    | Flash jump / Treesitter jump |

### LSP

| Key          | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gr`         | Find references      |
| `rn`         | Rename symbol        |
| `<leader>ca` | Code action          |
| `<leader>gf` | Format buffer        |

### AI assistants

| Key          | Action                          |
| ------------ | ------------------------------- |
| `<leader>ac` | Toggle Claude Code              |
| `<leader>af` | Focus Claude Code               |
| `<leader>as` | Send selection to Claude (visual) |
| `<leader>aa` | Accept diff                     |
| `<leader>ad` | Deny diff                       |
| `<C-a>`      | Ask opencode about current line |
| `<C-t>`      | Toggle opencode                 |

## Diagnostics

`init.lua` defines user commands to control how diagnostics are displayed:

| Command                          | Effect                                  |
| -------------------------------- | --------------------------------------- |
| `:DiagnosticsToggle`             | Enable / disable diagnostics            |
| `:DiagnosticsErrorsOnly`         | Show only errors                        |
| `:DiagnosticsErrorsWarnings`     | Show errors and warnings                |
| `:DiagnosticsAll`                | Reset to showing everything             |
| `:DiagnosticsHideVirtualText`    | Hide inline virtual text                |
| `:DiagnosticsShowVirtualText`    | Show inline virtual text                |
| `:DiagnosticsSetLevel {LEVEL}`   | Set minimum severity (`ERROR`/`WARN`/`INFO`/`HINT`) |

## Customization

- **Add a plugin** — create a new file in `lua/plugins/` returning a lazy.nvim spec.
- **Change the colorscheme** — edit the `colorscheme` line in `lua/config/keymaps.lua` and the spec in `lua/plugins/nightfox.lua`.
- **Add LSP servers** — add the server to `ensure_installed` and the `vim.lsp.config` / `vim.lsp.enable` block in `lua/plugins/lsp.lua`.
- **Editor options** — set them in `init.lua` (indentation, folding, clipboard, etc.).

After changing plugins, run `:Lazy sync` to install and update.
