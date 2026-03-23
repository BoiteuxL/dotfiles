#!/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR


echo "Installing dependencies"
yay -S --needed $(cat ./dependencies)

cd files
echo "Linking dotfiles"
stow . -t $HOME --verbose
ln -sf "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"

echo "Downloading GTK theme"
sudo pacman -S gtk-engine-murrine
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git --depth=1
./Catppuccin-GTK-Theme/themes/install.sh -l -c dark -t lavender --tweaks macos 
rm -rf ./Catppuccin-GTK-Theme