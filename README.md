# Dotfiles

Personal shell, editor and AI-agent configuration for macOS, Linux and GitHub Codespaces.

## Install

Requires `curl`, `git`, `zsh` and internet access. `setup` replaces existing shell/editor
configuration files with symlinks to this checkout.

### Codespaces

Enable **Automatically install dotfiles** in [Codespaces settings](https://github.com/settings/codespaces)
and select this repo. GitHub runs `install.sh` in new Codespaces; existing ones are not updated automatically.

Keep VS Code preferences in Settings Sync and project dependencies in `devcontainer.json`,
as described in [GitHub's personalization guide](https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account).

### Local

```bash
git clone https://github.com/vanelin/dotfiles.git ~/.dotfiles
bash ~/.dotfiles/setup
```

Or let the installer clone the repo:

```bash
curl -fsSL https://raw.githubusercontent.com/vanelin/dotfiles/main/install.sh | bash
```

Start `zsh` afterward. To retry failed optional installs, rerun `bash setup` from the checkout.

## What you get

- **Zsh:** Oh My Zsh, autosuggestions, syntax highlighting, fzf integration and Kubernetes prompt.
  Shortcuts include `k` (kubectl), `h` (Helm) and `tf` (OpenTofu).
- **Vim and tmux:** syntax plugins, persistent undo, mouse support and vi-style copy mode.
- **k9s:** Nord skin.
- **CLI tools:** ripgrep, fd, gh, yq, shellcheck, kubectx, uv, k9s, tflint, latest fzf and tenv.
  With tenv, Terraform/OpenTofu/Terragrunt versions are installed on first use.

The listed CLI tools are installed only on Debian/Ubuntu with root or passwordless sudo.
Elsewhere, install those tools yourself (for example, with Homebrew on macOS).
`setup` does not install kubectl or Helm; provide them through your project environment.
See [setup](setup) for the full installation list.

## AI agents

Claude Code and Codex CLI use standalone installers. Both get [shared rules](agents/AGENTS.md)
and Context7 MCP for library documentation. Claude also gets ccstatusline and the
[Codex plugin](https://github.com/openai/codex-plugin-cc) (`/codex:review`).

The status line and plugin need Node.js/npm, already included in the
[Codespaces universal image](https://github.com/devcontainers/images/blob/main/src/universal/.devcontainer/devcontainer.json).

Sign in, then run `claude` or `codex` from your project directory:

- **Claude:** launch `claude` and use `/login`. Alternatively, run `claude setup-token` locally
  and save its output as the `CLAUDE_CODE_OAUTH_TOKEN` Codespaces secret.
  See [authentication](https://code.claude.com/docs/en/authentication).
- **Codex:** run `codex login --device-auth` for browser login from a Codespace.
  Enable device-code login first as described in [authentication](https://learn.chatgpt.com/docs/auth#login-on-headless-devices).

Claude defaults to auto mode; review its [permissions](claude/settings.json) before using infrastructure credentials.

## Customizing

- Shell/editor configs, shared agent rules, k9s skin and ccstatusline settings are **symlinked**.
  Edit them in the repo, then reload the relevant app or shell.
- [Claude settings](claude/settings.json), [Claude instructions](claude/CLAUDE.md) and
  [Codex config](codex/config.toml) are **copied only when missing**. Apply later changes to existing copies manually.

Put secrets and machine-specific shell overrides in `~/.zshrc.local` (loaded by Zsh)
or Codespaces Secrets. Never commit credentials.
