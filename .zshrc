# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bureau"

# History dates and size
HIST_STAMPS="dd.mm.yyyy"

HISTSIZE=3000
SAVEHIST=3000

# Bundled and custom plugins
plugins=(
    golang
    git
    github
    colorize
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    terraform
    aws
    tmux
    gh
    fzf
    uv
)

source $ZSH/oh-my-zsh.sh

# GNU command colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
fi

export EDITOR='vim'

export LESS='-R'

# Personal aliases override plugin defaults.
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

function cht { curl "cht.sh/$1"; }

alias ll='ls -lht'
alias la='ls -lhFtA'
alias l='ls -CF'
alias tf=tofu

# kubectl aliases and completion
if [[ $commands[kubectl] ]]; then
    source <(kubectl completion zsh)
    alias k=kubectl
    alias kc='kubectx'
    alias kn='kubens'
    compdef k=kubectl
fi

# Helm alias and completion
if [[ $commands[helm] ]]; then
    source <(helm completion zsh)
    alias h=helm
    compdef h=helm
fi

# kubectl plugins
export PATH="${PATH}:${HOME}/.krew/bin"

# Kubernetes context in the prompt
if [ -f "$HOME/.oh-my-zsh/custom/plugins/kube-ps1/kube-ps1.sh" ]; then
    source "$HOME/.oh-my-zsh/custom/plugins/kube-ps1/kube-ps1.sh"
    PROMPT='$(kube_ps1)'$PROMPT
fi

# Optional tool completions
[[ $commands[minikube] ]] && source <(minikube completion zsh)


if [[ $commands[k9s] ]]; then
    alias kk="EDITOR='code --wait' k9s"
    source <(k9s completion zsh)
    export K9S_CONFIG_DIR="$HOME/.config/k9s"  # same dir on macOS and Linux, where setup puts the skin
    export K9S_SKIN=nord
fi

# tenv: terraform / tofu / terragrunt version manager
if [[ $commands[tenv] ]]; then
    source <(tenv completion zsh)
fi

# Local secrets and overrides, not in git
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
