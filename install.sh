#!/bin/bash

# ZSH

echo "Installing ZSH with Starship..."
sudo dnf install zsh stow

curl -sS https://starship.rs/install.sh | sh

chsh -s "/usr/bin/zsh" # User
sudo chsh -s "/usr/bin/zsh" # Root

# VSCode
while IFS= read -r extension; do
    code --install-extension $extension --force
done < vscode-extensions


# GNU Stow
echo "Running GNU Stow..."
stow .


echo "Done!"
