#!/usr/bin/env bash

export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CONFIG_HOME/nixpkgs"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd "$SCRIPT_DIR" && git submodule update --init || (echo "Failed to update submodules" && exit 1)

ln -sf "$SCRIPT_DIR/config.nix" "$XDG_CONFIG_HOME/nixpkgs/"

nix-env -iA nixpkgs.devcontainer

stow . && cd - && echo "Done!"
