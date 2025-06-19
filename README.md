# tmux + Neovim Config

This repository contains my personal configuration for [tmux](https://github.com/tmux/tmux) and [Neovim](https://neovim.io/). It’s lightweight, fast, and tailored for development.

## 🌱 Features

### tmux
- Sensible keybindings
- Mouse support
- Split window navigation

### Neovim
- Lua-based config (Neovim 0.5+)
- Plugin manager: `lazy.nvim` or `packer.nvim`
- LSP support, tree-sitter, statusline, etc.

## 📦 Installation

Clone the repository and symlink the files to your home directory.

```bash
git clone https://github.com/yourusername/tmux-nvim-config.git ~/.dotfiles

# Symlink tmux
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

# Symlink Neovim
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/nvim/* ~/.config/nvim/

