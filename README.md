# Dotfiles

Personal dotfiles for Unix/Linux environments with automatic setup for GitHub Codespaces.

## Features

- **zsh** configuration with oh-my-zsh (bureau theme)
- **vim** setup with vim-plug and plugins
- **tmux** configuration with vi-mode
- **fd** (fd-find) fast file finder with proper symlink for Ubuntu/Debian
- **k9s** Kubernetes CLI with Nord theme (auto-installed in Codespaces)
- **uv** Python package manager (auto-installed in Codespaces)
- **Kubernetes tools** aliases and completions (kubectl, helm, kubectx, kubens)
- **Multi-architecture support** (amd64/arm64)

## Quick Start

### GitHub Codespaces

**Recommended Setup:**

1. Go to [GitHub Codespaces Settings](https://github.com/settings/codespaces)
2. Enable "Automatically install dotfiles"
3. Select your dotfiles repository
4. Create any Codespace from any project - dotfiles will install automatically

**VS Code Configuration:**
- Use **Settings Sync** to synchronize VS Code settings, extensions, and keybindings across all Codespaces
- For project-specific extensions and settings, create `.devcontainer/devcontainer.json` in each project repository

After setup completes, run:
```bash
zsh
```

### Local Installation

```bash
git clone https://github.com/vanelin/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup
```

After setup completes:
```bash
zsh
```

### Remote Installation

```bash
curl -fsSL https://raw.githubusercontent.com/vanelin/dotfiles/main/install.sh | bash
cd ~/.dotfiles
zsh
```

## What's Included

### Shell Configuration
- oh-my-zsh with plugins: git, github, docker, golang, terraform, colorize, colored-man-pages
- zsh-autosuggestions and zsh-syntax-highlighting
- kubectl completions and aliases: `k` (kubectl), `kc` (kubectx), `kn` (kubens)
- helm completion with `h` alias
- kube_ps1 prompt integration (shows Kubernetes context in prompt)
- krew plugin manager support
- Terraform, terragrunt completions and aliases (e.g., `tf`, `tfa`, `tfp`, `tfi`)
- Python tooling: uv and uvx completions
- FZF fuzzy finder with key bindings (Ctrl+R for history, Ctrl+T for files, Alt+C for cd)
- fd (fast file finder, symlinked from fdfind on Ubuntu/Debian)
- Custom function: `cht` for accessing cht.sh

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

### Development Tools (Auto-installed)
- **Kubernetes**: k9s (CLI dashboard), kubectx, kube-ps1
- **Infrastructure as Code**: Terraform, terragrunt, tflint
- **Python**: uv (package manager)
- **CLI Tools**: fd (file finder), fzf (fuzzy finder), ripgrep, gh (GitHub CLI), shellcheck, yq

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
