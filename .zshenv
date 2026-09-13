# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# tenv: auto-install pinned terraform/tofu/terragrunt versions (here so non-interactive zsh gets it too)
export TENV_AUTO_INSTALL=true
# Codespaces provides GITHUB_TOKEN; lets tenv avoid the anonymous GitHub API rate limit
[ -n "${GITHUB_TOKEN:-}" ] && export TENV_GITHUB_TOKEN="${TENV_GITHUB_TOKEN:-$GITHUB_TOKEN}"
