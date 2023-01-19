#!/bin/bash

##### Colours #####
# Reset
Color_Off='\033[0m\n'       # Text Reset

# Regular Colors
Green='\033[0;32m'          # Green
Cyan='\033[0;36m'           # Cyan

alias cls='printf "\033c"'
##### Colours End #####

# Current Script Directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Install Packages
printf "${Cyan}Installing Packages (this may take a while)${Color_Off}"
sudo apt-get install bspwm btop cmake compton curl dunst feh grc libfontconfig1-dev libfreetype6-dev libxcb-xfixes0-dev libxkbcommon-dev lolcat neofetch nodejs npm pkg-config polybar python3 rofi scrot sxhkd tmux tree xclip zsh -yqq > /dev/null
printf "${Green}Packages Installed${Color_Off}"
sleep 2
clear

# Check if .config folder exists
mkdir -p "$HOME/.config"

# Setup Symlinks
printf "${Cyan}Creating Symlinks${Color_Off}"
ln -nsf "$SCRIPT_DIR/alacritty" $HOME/.config
ln -nsf "$SCRIPT_DIR/bspwm" $HOME/.config
ln -nsf "$SCRIPT_DIR/compton" $HOME/.config
ln -nsf "$SCRIPT_DIR/dunst" $HOME/.config
ln -nsf "$SCRIPT_DIR/neofetch" $HOME/.config
ln -nsf "$SCRIPT_DIR/nvim" $HOME/.config
ln -nsf "$SCRIPT_DIR/polybar" $HOME/.config
ln -nsf "$SCRIPT_DIR/rofi" $HOME/.config
ln -nsf "$SCRIPT_DIR/sxhkd" $HOME/.config

# ZSH and TMUX Symlinks
ln -nsf "$SCRIPT_DIR/.zshrc" $HOME/
ln -nsf "$SCRIPT_DIR/tmux/.tmux.conf" $HOME/
printf "${Green}Symlinks Created${Color_Off}"
sleep 2
clear

# Install Alacritty
printf "${Cyan}Installing Alacritty${Color_Off}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install alacritty --quiet
printf "${Green}Alacritty Installed${Color_Off}"
sleep 2
clear

# Install Neovim
printf "${Cyan}Installing Neovim${Color_Off}"
curl -s -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -nsf /squashfs-root/AppRun /usr/bin/nvim
printf "${Green}Neovim Installed${Color_Off}"
sleep 2
clear

# Node Setup
printf "${Cyan}Installing Node${Color_Off}"
sudo npm i -g n
sudo n stable
hash -r
sudo npm i -g npm@latest yarn
printf "${Green}Node installed and updated${Color_Off}"
sleep 2
clear

# Neovim Plugins
printf "${Cyan}Installing Neovim Plugins${Color_Off}"
sh -c 'curl -s -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim -E -s -u "$HOME/.config/nvim/init.lua" +PlugInstall +qall
printf "${Green}Plugins Installed${Color_Off}"
sleep 2
clear

# Setup Folders and Wallpaper
printf "${Cyan}Setting up folders${Color_Off}"
mkdir -p "$HOME/Pictures/Wallpapers"
mkdir -p "$HOME/Pictures/Screenshots"
curl -s https://w.wallhaven.cc/full/j5/wallhaven-j5v2lm.jpg -o "$HOME/Pictures/Wallpapers/wallhaven-j5v2lm.jpg"
printf "${Green}Folders and Wallpaper done${Color_Off}"

# ZSH History Setup
printf "${Cyan}Setting up ZSH${Color_Off}"
mkdir -p "$HOME/.cache/zsh"
touch "$HOME/.cache/zsh/history"

# ZSH Private Setup
mkdir -p "$SCRIPT_DIR/zsh/private"
touch "$SCRIPT_DIR/zsh/private/aliases"
touch "$SCRIPT_DIR/zsh/private/exports"

# ZSH Plugins Setup
mkdir -p "$SCRIPT_DIR/zsh/plugins"
git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git "$SCRIPT_DIR/zsh/plugins/zsh-syntax-highlighting"
git clone --quiet https://github.com/zsh-users/zsh-autosuggestions.git "$SCRIPT_DIR/zsh/plugins/zsh-autosuggestions"

# ZSH Default Shell
chsh -s $(which zsh)
printf "${Green}ZSH Setup Complete${Color_Off}"
sleep 2
clear

# Setup Fonts
printf "${Cyan}Installing Fonts${Color_Off}"
mkdir -p "$HOME/.local/share/fonts"
curl -s https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf -o "$HOME/.local/share/fonts/Fira Code Regular Nerd Font Complete.ttf"
fc-cache -f

printf "${Green}Setup Completed. Please re-login for ZSH change to take place${Color_Off}"
printf "${Green}Alacritty will also need to be set as the default terminal manually${Color_Off}"
printf "${Green}BSPWM and Polybar may need to be modified also${Color_Off}"
