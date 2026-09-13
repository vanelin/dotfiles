#!/bin/bash

# Entry point for Codespaces (which runs install.sh before setup) and for
# `curl | bash`. Reuses the checkout it lives in; clones only when piped.

set -e

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/vanelin/dotfiles.git}"
DOTFILES_DIR="$HOME/.dotfiles"

if [ -f "${BASH_SOURCE[0]:-}" ] && [ -f "$(dirname "${BASH_SOURCE[0]}")/setup" ]; then
    cd "$(dirname "${BASH_SOURCE[0]}")"
elif [ -d "$DOTFILES_DIR" ]; then
    echo "Updating dotfiles in $DOTFILES_DIR..."
    cd "$DOTFILES_DIR"
    git pull
else
    echo "Cloning $DOTFILES_REPO to $DOTFILES_DIR..."
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi

echo "Running setup from $PWD..."
bash setup

echo "Installation complete!"
echo "To switch to zsh, run: zsh"
