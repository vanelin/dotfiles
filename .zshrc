# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bureau"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    golang
    git
    github
    colorize
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker)

source $ZSH/oh-my-zsh.sh

# User specific aliases and functions
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
fi

export EDITOR='vim'

export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

function cht { curl "cht.sh/$1"; }

# some more ls aliases
alias ll='ls -lht'
alias la='ls -lhFtA'
alias l='ls -CF'

# Enable autocompletion kubectl
if [[ $commands[kubectl] ]]; then
    source <(kubectl completion zsh)
    alias k=kubectl
    alias kc='kubectx'
    alias kn='kubens'
    complete -F __start_kubectl k
fi

# Enable autocompletion helm
if [[ $commands[helm] ]]; then
    source <(helm completion zsh)
    alias h=helm
    complete -F __start_helm h
fi

# Enable krew plugin manager for kubectl
export PATH="${PATH}:${HOME}/.krew/bin"

# Enable kube_ps1 if available
if [ -f "$HOME/.oh-my-zsh/custom/plugins/kube-ps1/kube-ps1.sh" ]; then
    source "$HOME/.oh-my-zsh/custom/plugins/kube-ps1/kube-ps1.sh"
    PROMPT='$(kube_ps1)'$PROMPT
fi

# Enable autocompletion
[[ $commands[minikube] ]] && source <(minikube completion zsh)

# FZF integration
if [ -f ~/.fzf.zsh ]; then
    # FZF installed via git
    source ~/.fzf.zsh
elif [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    # FZF installed via apt (Debian/Ubuntu)
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi