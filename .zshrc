# -----------------------------------
# Sources
# -----------------------------------
source ~/.dotfiles/.variables
source ~/.dotfiles/.functions
source ~/.dotfiles/.aliases

# -----------------------------------
# Update DotFiles
# -----------------------------------
getDotfiles

# -----------------------------------
# ZSH Setup
# -----------------------------------
ZSHSetup

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
