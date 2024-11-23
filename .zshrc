#-----------------------------------
# Sources
#-----------------------------------
source ~/.zsh/functions
source ~/.zsh/aliases
source ~/.zsh/exports

if [ -d ~/.zsh/private ]; then
  source ~/.zsh/private/aliases
  source ~/.zsh/private/exports
fi

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
