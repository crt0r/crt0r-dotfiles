bind "set colored-completion-prefix on"
bind "set completion-ignore-case on"
bind "set blink-matching-paren on"
bind "set editing-mode vi"
bind "set show-mode-in-prompt on"
bind '"\C-C":"\e"'
stty intr ^K

# bashrc get help for aliases by selector
function bah {
    TAG="$1"

    if [ "$TAG" == "git" ]; then
        __GET_BY_TAG__ "#-git"
    elif [ "$TAG" == "kubectl" ]; then
        __GET_BY_TAG__"#-kubectl"
    fi
}

function __GET_BY_TAG__ {
    grep --color=never "^alias .*$1" "/home/$(whoami)/.bashrc" | sed "s/\s*#-.*$//g"
}

# Export GPG TTY for commit signing via SSH
export GPG_TTY="$(tty)" #-gpg

# Useful git aliases
alias gini="git init" #-git
alias ga="git add" #-git
alias gaa="ga ." #-git
alias gl="git log" #-git
alias gln="git --no-pager log" #-git
alias gs="git status" #-git
alias gc="git commit" #-git
alias gcm="gc -m" #-git
alias gb="git branch" #-git
alias gcb="git checkout -b" #-git
alias gst="git stash" #-git
alias gstp="gst pop" #-git
alias gstd="gst drop" #-git
alias gp="git push"
alias gpu="gp -u"
alias gcog="git config --global"
alias gcogun="gcog user.name"
alias gcogue="gcog user.email"
alias gcoguk="gcog user.signingKey"
alias gcogcs="gcog commit.gpgSign"

# Useful kubectl aliases
alias klexe="kubectl exec" #-kubectl
alias klexeit="kubectl exec -it" #-kubectl
alias kldel="kubectl delete" #-kubectl
alias klg="kubectl get" #-kubectl
alias klgp="klg pods" #-kubectl
alias klgd="klg deployments" #-kubectl
alias klgpv="klg pv" #-kubectl
alias klgpvc="klg pvc" #-kubectl
alias kldes="kubectl describe" #-kubectl
alias kldesp="kldes pod" #-kubectl
alias kldespv="kldes pv" #-kubectl
alias kldespvc="kldes pvc" #-kubectl
alias kll="kubectl logs" #-kubectl
