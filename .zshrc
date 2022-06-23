# -----------------------------------
# Sources
# -----------------------------------
source ~/.dotfiles/.variables
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
setopt PROMPT_SUBST
autoload -U add-zsh-hook
add-zsh-hook precmd updatePrompt

# -----------------------------------
# Path Exports
# -----------------------------------
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
