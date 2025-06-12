# NeoCat Neovim Configuration

A minimal, modern Neovim configuration built for simplicity and productivity.

## Overview

This configuration provides a clean, fast development environment with essential features:

- **Minimalist approach**: Only includes what you actually need
- **Modern plugins**: Uses the latest and most performant tools
- **Transparent workflow**: File editing feels natural and unobtrusive
- **Smart defaults**: Sensible configuration that works out of the box

## Key Features

### Core Experience
- **Gruvbox Material** colorscheme with transparency
- **Oil.nvim** for buffer-like file management
- **Blink.cmp** for lightning-fast completion
- **Snacks.nvim** dashboard with custom branding

### Development Tools
- Auto-formatting on save with language-specific formatters
- Smart indentation detection
- Enhanced Lua development support
- Modern plugin management with lazy loading

## Setup

1. **Requirements**: Neovim 0.11+, Git, Nerd Font
2. **Install**: Copy to `~/.config/nvim/`
3. **Launch**: Start Neovim - plugins install automatically

### LSP Config
This config no longer uses mason to install LSP, linters and formatters. Please install the desired ones from the supported ones in `./lsp`

## Configuration Philosophy

The config is structured for easy customization:
- Core settings in `lua/config/`
- Plugin configs in `lua/plugins/`
- Each plugin in its own file for clarity

Add new plugins by creating files in `lua/plugins/` - they're loaded automatically.

## Key Bindings

- `<Space>` - Leader key
- `\\` - File explorer
- `<leader>f` - Format buffer

Simple, memorable, and efficient.
