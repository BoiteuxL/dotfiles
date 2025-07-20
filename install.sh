#!/bin/bash

cd ~
echo "Cloning dotfiles repository..."
git clone https://github.com/BoiteuxL/dotfiles.git
cd dotfiles

# Remove file to exclude from copy
rm ./README.mde
rm ./LICENSE
rm ./install.sh
rm -r ./.git

echo "Copying config files..."
find ${pwd} -type f -exec cp --parents {} $HOME \;  -exec echo "	Copied {}..." \; 
cd $HOME
rm -r ./dotfiles

# Install packages and apps
#yay -Sy zsh ptyxis visual-studio-code-bin htop steam

chsh $USER -s /bin/zsh
curl -sS https://starship.rs/install.sh | sh

# Enable services
sudo systemctl enable --now bluetooth

# Cleanup .desktop files
