# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository for managing Unix/Linux configuration files. The repository contains shell configurations (zsh), editor settings (vim, tmux), Kubernetes tooling configurations (k9s), and a setup script for installing dependencies and creating symbolic links.

## Setup and Installation

### Local Machine Setup

**Initial setup on a new machine:**
```bash
./setup
```

This script will:
- Create necessary directories (`$HOME/.config/bash`, `$HOME/.config/k9s`)
- Create symbolic links for configuration files
- Install oh-my-zsh and required plugins (zsh-autosuggestions, zsh-syntax-highlighting, kube-ps1)
- Install vim-plug and Vim plugins automatically
- Install Hack Nerd Font for terminal
- Install required packages via apt (ripgrep, gh, gcc, g++, unzip, fd-find, fzf, kubectx)
- Install development tools:
  - k9s (Kubernetes CLI)
  - uv (Python package manager)
  - Terraform (Infrastructure as Code tool)
  - tflint (Terraform linter)
  - Terragrunt (Terraform wrapper)
- Configure zsh completions for installed tools

**Note:** kubectl and helm can be installed via devcontainer features or manually. Dotfiles provide shell aliases and completions for them.

### GitHub Codespaces Setup

**Recommended: Use GitHub Dotfiles Settings**

1. Go to https://github.com/settings/codespaces
2. Enable "Automatically install dotfiles"
3. Select this repository
4. Create any Codespace - dotfiles will be installed automatically

**VS Code Configuration:**
- Use Settings Sync (built-in VS Code feature) to synchronize settings, extensions, and keybindings across all Codespaces
- For project-specific extensions and settings, create `.devcontainer/devcontainer.json` in each project repository
- Dotfiles handle only shell and terminal configuration (zsh, vim, tmux, kubectl, helm)

**Manual installation in Codespaces or remote environments:**
```bash
curl -fsSL https://raw.githubusercontent.com/vanelin/dotfiles/main/install.sh | bash
```

Or clone and run setup:
```bash
git clone https://github.com/vanelin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup
```

After setup completes, switch to zsh:
```bash
zsh
```

**Note:** The setup script is designed to be idempotent and safe to run multiple times.

## Configuration Files Structure

### Shell Configuration
- `.zshrc` - Main zsh configuration with oh-my-zsh (bureau theme)
- `.zshenv` - PATH configuration for `~/bin` and `~/.local/bin`
- `.zprofile` - Sources `.zshrc` on login

**Key shell features:**
- oh-my-zsh with plugins: golang, git, github, colorize, colored-man-pages, zsh-autosuggestions, zsh-syntax-highlighting, docker, terraform
- Kubernetes tooling:
  - Kubernetes prompt integration with `kube_ps1` (automatically enabled if installed)
  - kubectl completions and aliases: `k` (kubectl), `kc` (kubectx), `kn` (kubens)
  - helm completion with `h` alias (if helm is available)
  - k9s completion (if k9s is installed)
  - krew plugin manager enabled (`$HOME/.krew/bin` in PATH)
- Infrastructure as Code tools:
  - Terraform completion and aliases via oh-my-zsh plugin (e.g., `tf`, `tfa`, `tfp`, `tfi`)
  - Terragrunt completion (if terragrunt is installed)
- Python tooling:
  - uv and uvx completions (if uv is installed)
- FZF integration with key bindings (Ctrl+R, Ctrl+T, Alt+C)
- Custom function: `cht` for accessing cht.sh (e.g., `cht python/list`)

**Note:** The shell configuration gracefully handles missing commands (kubectl, helm, kube_ps1, minikube, k9s, terraform, terragrunt, uv). If these tools are not installed, the related features will be skipped without errors.

### Editor Configuration
- `.vimrc` - Vim configuration with vim-plug plugins (indentLine, vim-polyglot)
  - 4-space tabs by default, 2-space for YAML
  - Undo history persistence in `/tmp/.vim/backups`

### Terminal Multiplexer
- `.tmux.conf` - tmux configuration
  - Vi-mode for copy mode
  - Mouse support enabled
  - Status bar at top with custom styling
  - Panes start at index 1
  - Custom status-right with `pomo` integration
  - Reload config: `prefix + r`

### Kubernetes Tooling
- `k9s/skin.yml` - Nord theme for k9s Kubernetes CLI

## Making Changes

When modifying configuration files:
1. Edit the file in this repository
2. The symbolic links will automatically reflect changes (no need to re-run setup)
3. For shell changes, either restart your shell or run `source ~/.zshrc`
4. For vim changes, restart vim or run `:source ~/.vimrc`
5. For tmux changes, reload with `prefix + r` (or `tmux source-file ~/.tmux.conf`)

## Adding New Configurations

To add a new configuration file:
1. Add the file to the repository root (or appropriate subdirectory like `k9s/`)
2. Update the `setup` script to create the symbolic link
3. Document the configuration in this file if it has special behavior or dependencies
