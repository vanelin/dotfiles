# Dotfiles

Personal shell, editor and AI agent configuration for local machines and GitHub Codespaces.
See `README.md` for installation instructions and `setup` for the current tool list.

## Setup

- `setup` changes into its own directory, so it can run from anywhere.
- Codespaces runs `install.sh` (searched before `setup`); it runs `setup` from its own
  checkout, and clones into `~/.dotfiles` only when piped from `curl`.
- `setup` installs shell/editor dependencies and standalone Claude/Codex binaries;
  APT tools are conditional on `apt-get` and root or passwordless sudo access.
- AI binaries, configs, MCP and the codex plugin all run before the optional APT tools.
- fzf is taken from the latest GitHub release, not APT, because the plugin needs `fzf --zsh` (0.48+).
- Install kubectl and Helm through each project's devcontainer or manually.
- Use Codespaces dotfiles settings for personal setup, Settings Sync for VS Code,
  and each project's `devcontainer.json` for project dependencies.

## Configuration

- `.zshrc`, `.zshenv`: shell and PATH configuration. `.zshenv` sets `TENV_AUTO_INSTALL` and maps
  `GITHUB_TOKEN` to `TENV_GITHUB_TOKEN`; `.zshrc` sources `~/.zshrc.local` for secrets (gitignored).
- `starship.toml`: prompt, linked to `~/.config/starship.toml`; `setup` installs starship to `~/.local/bin`
  and `.zshrc` sets `ZSH_THEME=""`. Custom modules are gated by `STARSHIP_COCKPIT_*` env vars (off by default).
- `.vimrc`, `.tmux.conf`, `k9s/skins/nord.yaml`: editor, terminal and Kubernetes UI (skin selected via `K9S_SKIN` in `.zshrc`).
- These files are symlinked by `setup`; edit their repository sources.
- `agents/AGENTS.md`: shared agent rules. `setup` links it to `~/.agents/AGENTS.md`
  and links `~/.codex/AGENTS.md` to that file. Edit shared rules only in this source.
- `claude/CLAUDE.md`: Claude-specific instructions; imports `@~/.agents/AGENTS.md`.
- `claude/settings.json`: Claude permissions, output style and status line (no model pinned: the plan default is used).
  Starts in auto mode; `autoMode.soft_deny` adds infra apply/delete rules on top of `$defaults`.
  Declares the `openai-codex` marketplace and enables the `codex` plugin (`/codex:review`, `/codex:rescue`); `setup` installs it via `claude plugin`.
- `codex/config.toml`: portable Codex defaults and Context7 MCP configuration.
- Claude files and Codex config are copied to `~/.claude/` and `~/.codex/` only
  when missing. Repository edits do not update existing copies; preserve local changes.
- `ccstatusline/settings.json`: symlinked to `~/.config/ccstatusline/settings.json`.
  Claude runs it via `npx -y ccstatusline@latest`, which requires Node.js/npm.
  Its interactive editor (`npx ccstatusline@latest`) writes through the symlink.
- Context7 is declared in Codex config and registered for Claude with
  `claude mcp add --scope user`; Claude stores user MCP servers in `~/.claude.json`.

## Editing

- Keep changes focused and match existing style. Do not pin models or model-specific settings; they go stale.
- Keep machine-specific state, credentials and project trust out of portable configs.
- When adding a config, update `setup` and document its destination and dependencies.
- Reload zsh with `source ~/.zshrc`, Vim with `:source ~/.vimrc`, and tmux with
  `prefix + r` or `tmux source-file ~/.tmux.conf`.

## Verification

No test suite. Run relevant checks from the repository root:

```sh
for f in setup install.sh; do bash -n "$f"; done   # bash -n checks only its first argument
shellcheck setup install.sh
for f in .zshrc .zshenv; do zsh -n "$f"; done
jq empty claude/settings.json ccstatusline/settings.json
git diff --check
```

Parse `codex/config.toml` with a TOML parser when changing it.
Syntax checks do not verify bootstrap. For an end-to-end run, use a clean container
(`mcr.microsoft.com/devcontainers/base:ubuntu` mirrors Codespaces; `ubuntu:24.04` covers root without sudo):

```sh
docker run --rm -v "$PWD":/dotfiles:ro mcr.microsoft.com/devcontainers/base:ubuntu \
  bash -c 'cp -r /dotfiles ~/d && ~/d/install.sh && zsh -ic "claude --version; codex --version; tenv version"'
```
