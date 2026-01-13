# Dotfiles

Personal dotfiles for Unix/Linux environments with automatic setup for GitHub Codespaces.

## Features

- **zsh** configuration with oh-my-zsh (bureau theme)
- **vim** setup with vim-plug and plugins
- **tmux** configuration with vi-mode
- **k9s** Nord theme for Kubernetes CLI
- **Kubernetes tools** auto-installation and configuration (kubectl, helm, krew)
- **Multi-architecture support** (amd64/arm64)

## Quick Start

### GitHub Codespaces

This repository automatically sets up your environment when you create a new Codespace. After the setup completes, run:

```bash
zsh
```

### Local Installation

```bash
git clone https://github.com/USERNAME/REPO.git ~/.dotfiles
cd ~/.dotfiles
./setup
```

After setup completes:
```bash
zsh
```

### Remote Installation

```bash
curl -fsSL https://raw.githubusercontent.com/USERNAME/REPO/main/install.sh | bash
cd ~/.dotfiles
zsh
```

## What's Included

### Shell Configuration
- oh-my-zsh with plugins: git, github, docker, golang
- zsh-autosuggestions and zsh-syntax-highlighting
- kubectl/helm automatic installation and completions
- kube_ps1 prompt integration (Kubernetes context in prompt)
- krew plugin manager support
- Custom function: `cht` for accessing cht.sh
- Multi-architecture support (amd64/arm64 auto-detection)

### Editor Configuration
- vim with vim-plug
- indentLine and vim-polyglot plugins
- 4-space tabs (2-space for YAML)
- Persistent undo history

### Terminal Multiplexer
- tmux with vi-mode for copy
- Mouse support enabled
- Custom status bar with pomo integration
- Reload config: `prefix + r`

## Customization

All configuration files are symlinked from this repository. To customize:

1. Edit files in the repository
2. Changes take effect immediately (or reload: `source ~/.zshrc` / `:source ~/.vimrc` / `prefix + r`)

## Files

- `.zshrc` - zsh configuration
- `.zshenv` - PATH configuration
- `.zprofile` - Login shell configuration
- `.vimrc` - vim configuration
- `.tmux.conf` - tmux configuration
- `k9s/skin.yml` - k9s Nord theme
- `setup` - Main installation script
- `install.sh` - Remote installation script
- `.devcontainer/devcontainer.json` - GitHub Codespaces configuration
