#!/bin/bash

# ZSH

echo "Installing ZSH with Starship..."
sudo pacman -S zsh starship --noconfirm

chsh -s "/bin/zsh" # User
sudo chsh -s "/bin/zsh" # Root

# KDE Theme
git clone --depth=1 https://github.com/catppuccin/kde catppuccin-kde && cd catppuccin-kde
./install.sh
cd .. && rm -fr ./catppuccin-kde


# VSCode
while IFS= read -r extension; do
    code --install-extension $extension --force
done < vscode-extensions


# GNU Stow

echo "Running GNU Stow..."
stow .


echo "Done!"
clear