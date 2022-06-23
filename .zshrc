# -----------------------------------
# Sources
# -----------------------------------
source ~/.dotfiles/.functions

# -----------------------------------
# Update DotFiles
# -----------------------------------
getDotfiles

# -----------------------------------
# ZSH Setup
# -----------------------------------
ZSHSetup

# -----------------------------------
# Custom Aliases
# -----------------------------------
alias vim="nvim"
alias ll="ls -l"
alias lla="ll -A"
alias vei="cd \"/Volumes/External HDD/iOS Development\""
alias vew="cd \"/Volumes/External HDD/Web Development\""
alias ..="cd .."
alias ..."cd ../../"

# -----------------------------------
# Git Aliases
# -----------------------------------
alias gc="git checkout"
alias gd="git diff"
alias gs="git status"
alias gp="git push"
alias ga="git add"
alias gcm="git commit -m"
alias gwa="git worktree add"
alias gwr="git worktree remove"

# -----------------------------------
# Python Aliases
# -----------------------------------
alias python="python3"
alias pip="pip3"

# -----------------------------------
# Prompt Setup
# -----------------------------------
COLOR_DEF=$'\e[0m'
COLOR_USR=$'\e[38;5;208m'
COLOR_DIR=$'\e[38;5;75m'
COLOR_GITCLEAN=$'\e[38;5;117m'
COLOR_GITDIRTY=$'\e[38;5;184m'
setopt PROMPT_SUBST
PROMPT='${COLOR_USR}[wolfy] ▶ ${COLOR_DIR}%1~ ${COLOR_DEF}'

# -----------------------------------
# Path Exports
# -----------------------------------
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
