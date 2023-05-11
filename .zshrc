export ZSH="${HOME}/.oh-my-zsh"

# Theme.
ZSH_THEME="robbyrussell"

# Plugins.
plugins=(giti zsh-autosuggestions zsh-syntax-highlighting)

###############################################
alias k=kubectl
complete -o default -F __start_kubectl k
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
###############################################
[[ $commands[minikube] ]] && source <(minikube completion zsh)

source $ZSH/oh-my-zsh.sh
