#-----------------------------------
# Sources
#-----------------------------------
source ~/.zsh/functions
source ~/.zsh/aliases
source ~/.zsh/exports

source ~/.zsh/private/aliases
source ~/.zsh/private/exports

#-----------------------------------
# Setup ZSH
#-----------------------------------
SetupColors
SetupBindings
SetupHistory

# -----------------------------------
# Setup Plugins
# -----------------------------------
Plugin "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
Plugin "zsh-autosuggestions/zsh-autosuggestions.zsh"

# bun completions
[ -s "/home/adamwolf/.bun/_bun" ] && source "/home/adamwolf/.bun/_bun"
