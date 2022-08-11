# -----------------------------------
# Sources
# -----------------------------------
source ~/.dotfiles/.variables
source ~/.dotfiles/.functions
source ~/.dotfiles/.aliases

source ~/.dotfiles/private/.functions
source ~/.dotfiles/private/.aliases
source ~/.dotfiles/private/.exports

# -----------------------------------
# Update DotFiles
# -----------------------------------
checkUpdates

# -----------------------------------
# ZSH Setup
# -----------------------------------
ZSHSetup

# -----------------------------------
# Run neofetch
# -----------------------------------
neofetch

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

# bun completions
[ -s "/home/adamwolf/.bun/_bun" ] && source "/home/adamwolf/.bun/_bun"

# Bun
export BUN_INSTALL="/home/adamwolf/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
