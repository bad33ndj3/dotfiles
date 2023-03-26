##################
###### CUSTOM ####
##################

# HSTR configuration - add this to ~/.zshrc
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)

# Go development
export GOPATH=$HOME/go
export GOROOT="/opt/homebrew/opt/go@1.19/libexec" # this should be the path to your go installation
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

alias goc='go test -coverprofile=coverage.out -count=1 ./... && go tool cover -func=coverage.out | grep "total:" | awk "{print $3}"'
alias got='go test ./... --race'

# K8s
function ks() {  # param 1 = service, param 2 = period
   if [[ $3 ]];
    then stern $1 --timestamps --color=always  --container=$3  -t --since ${2:-10m} -o json
    else stern $1 --timestamps --color=always  --container=$1  -t --since ${2:-10m} -o json | jq .
  fi
}
alias ksa='ks service ${1:-10m}'
alias helmclear='helm list -q | grep service | xargs helm delete'

export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Kube

# The uncommented lines should come from kubectl instructions.
# autoload -Uz compinit
# compinit
# source <(kubectl completion zsh)
# complete -o default -o nospace -F __start_kubectl k
alias k=kubectl
alias ns=kubens
alias kt="kubectl get pods --sort-by=.status.startTime"

# Should download kubecolor for this to work.
# compdef kubecolor=kubectl
# alias kc=kubecolor

# IntelliJ IDEA
function ideawrapper() {
    open -na "IntelliJ IDEA.app" --args "$@"
}
alias idea='ideawrapper'
alias ide='ideawrapper -e' # open file in lite mode

# Productivity
alias gh='history|grep'
function killport() {
    if [ -n "$PORT_NUMBER" ]; then echo "PORT_NUMBER is set"; else  echo "PORT_NUMBER is unset"; return; fi
    sudo kill -9 `sudo lsof -t -i:${PORT_NUMBER}`
}

PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

# GIT
# deletes all local branches that have been deleted on the remote.
function gitclean(){
  git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
}

alias g="git"
alias gs="git status"
alias gl="git log"
alias gaa="git add -A"
alias gal="git add ."
alias gall="git add ."
alias gca="git commit -a"
alias gc="git commit -m"
alias gcot="git checkout"
alias gchekout="git checkout"
alias gchckout="git checkout"
alias gckout="git checkout"
alias gsh='git stash'
alias gw='git whatchanged'
alias gfa='git fetch --all'

alias lg3="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias lg1="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias lg2="git log --color --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s' --abbrev-commit"
alias lg="lg1"

alias sb="git branch --all | fzf"

# Exit Command
alias :q="exit"
alias ext="exit"
alias xt="exit"
alias by="exit"
alias bye="exit"
alias die="exit"
alias quit="exit"
