#!/bin/bash

# Quick installation script for GitHub Codespaces and remote environments
# This script clones the dotfiles repo and runs setup

set -e

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/vanelin/dotfiles.git}"
DOTFILES_DIR="$HOME/.dotfiles"

echo "Installing dotfiles from $DOTFILES_REPO"

# Clone or update dotfiles repository
if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory already exists, pulling latest changes..."
    cd "$DOTFILES_DIR"
    git pull
else
    echo "Cloning dotfiles repository..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

# Run setup script
echo "Running setup script..."
bash setup

echo "Installation complete!"
echo "To switch to zsh, run: zsh"
