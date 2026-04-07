#!/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR


echo "Installing dependencies"
yay -Syy --needed $(cat ./dependencies)

cd files
echo "Linking dotfiles"
stow . -t $HOME --verbose
ln -sf "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"

echo "Installing Ambxst..."
curl -L get.axeni.de/ambxst | sh
ambxst install hyprland