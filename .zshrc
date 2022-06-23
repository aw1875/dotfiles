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
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}

COLOR_DEF=$'\e[0m'
COLOR_USR=$'\e[38;5;208m'
COLOR_DIR=$'\e[38;5;75m'
COLOR_GITCLEAN=$'\e[38;5;117m'
COLOR_GITDIRTY=$'\e[38;5;184m'
setopt PROMPT_SUBST
PROMPT='${COLOR_USR}[wolfy] ▶ ${COLOR_DIR}%1~ ${COLOR_DEF}'

# Git Status
# if [ -n "$(parse_git_branch)" ]; then
#     if [ -n "$(git status --porcelain)" ]; then
#         PROMPT='${COLOR_USR}[wolfy] ▶ ${COLOR_DIR}%1~ ${COLOR_GITDIRTY}$(parse_git_branch)${COLOR_DEF} '$PROMPT
#     else
#         PROMPT='${COLOR_USR}[wolfy] ▶ ${COLOR_DIR}%1~ ${COLOR_GITCLEAN}$(parse_git_branch)${COLOR_DEF} '$PROMPT
#     fi
# else
#     PROMPT='${COLOR_USR}[wolfy] ▶ ${COLOR_DIR}%1~ ${COLOR_DEF}'$PROMPT
# fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
