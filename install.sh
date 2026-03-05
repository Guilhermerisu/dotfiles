#!/bin/bash

# Define paths
DOTFILES_DIR=$(pwd)
NVIM_TARGET="$HOME/.config/nvim"
TMUX_TARGET="$HOME/.tmux.conf"

echo "Starting dotfiles installation..."

# 1. Handle Neovim
if [ -L "$NVIM_TARGET" ] || [ -d "$NVIM_TARGET" ]; then
    echo "⚠️  Existing Neovim config found. Moving to ~/.config/nvim_backup"
    mv "$NVIM_TARGET" "${NVIM_TARGET}_backup"
fi
ln -s "$DOTFILES_DIR/nvim" "$NVIM_TARGET"
echo "✅ Neovim linked."

# 2. Handle Tmux
if [ -f "$TMUX_TARGET" ] || [ -L "$TMUX_TARGET" ]; then
    echo "⚠️  Existing tmux config found. Moving to ~/.tmux.conf_backup"
    mv "$TMUX_TARGET" "${TMUX_TARGET}_backup"
fi
ln -s "$DOTFILES_DIR/tmux/tmux.conf" "$TMUX_TARGET"
echo "✅ Tmux linked."

echo "✨ All done!"
