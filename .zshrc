# -----------------------------------
# Sources
# -----------------------------------
source ~/.dotfiles/zsh/functions
source ~/.dotfiles/zsh/aliases

source ~/.dotfiles/zsh/private/aliases
source ~/.dotfiles/zsh/private/exports

# -----------------------------------
# Setup Prompt
# -----------------------------------
PromptSetup

# -----------------------------------
# Setup Plugins
# -----------------------------------
Plugin "zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
Plugin "zsh-autosuggestions/zsh-autosuggestions.zsh"

# vim: set filetype=zsh :
