# Agent Guidelines for Neovim Config

## Commands
- **Lint**: `:lua vim.lsp.buf.format()` or `stylua` for Lua files
- **Type check**: `:lua vim.lsp.buf.hover()` or `:lua vim.diagnostic.open_float()`
- **Test**: No tests configured (config repo)
- **Build**: No build process (config repo)

## Code Style
- **Imports**: Use `require()` for modules, no relative paths
- **Formatting**: 2-space indentation, no semicolons, snake_case for variables
- **Naming**: camelCase for functions, UPPER_CASE for constants
- **Types**: No static typing (dynamic Lua), use descriptive names
- **Error handling**: Use `pcall()` for protected calls, check return values
- **Comments**: Minimal comments, self-documenting code preferred
- **Structure**: Plugin configs return table with setup functions
- **Tables**: Multi-line tables with proper alignment</content>
</xai:function_call">Check if stylua is available in PATH