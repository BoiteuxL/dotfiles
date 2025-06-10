#!/bin/bash

# ZSH

echo "Installing ZSH with Starship..."
sudo dnf install zsh starship stow --noconfirm

curl -sS https://starship.rs/install.sh | sh

chsh -s "/usr/bin/zsh" # User
sudo chsh -s "/usr/bin/zsh" # Root

# KDE Theme
#git clone --depth=1 https://github.com/catppuccin/kde catppuccin-kde && cd catppuccin-kde
#./install.sh
#cd .. && rm -fr ./catppuccin-kde

curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 - > /dev/null

# VSCode
while IFS= read -r extension; do
    code --install-extension $extension --force
done < vscode-extensions


# GNU Stow

echo "Running GNU Stow..."
stow .


echo "Done!"
