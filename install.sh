#!/bin/bash

cd $HOME
echo "Cloning dotfiles repository..."
git clone https://github.com/BoiteuxL/dotfiles.git
cd dotfiles

# Remove file to exclude from copy
rm -f ./README.md
rm -f ./LICENSE
rm -f ./install.sh
rm -rf ./.git

echo "Copying config files..."
find ${pwd} -type f -exec cp --parents {} $HOME \;  -exec echo "	Copied {}..." \; 
cd $HOME
rm -r ./dotfiles

# Install packages and apps
echo "Installing packages and apps..."
yay -Sy zsh ptyxis visual-studio-code-bin htop steam extension-manager gtk-engine-murrine cmatrix pipes.sh fastfetch

# ZSH
echo "Configuring ZSH..."
sudo chsh $USER -s /bin/zsh
curl -sS https://starship.rs/install.sh | sh


# Cleanup .desktop files
echo "Removing unused .desktop shortcuts"
sudo rm /usr/share/applications/avahi-discover.desktop
sudo rm /usr/share/applications/bvnc.desktop
sudo rm /usr/share/applications/bssh.desktop
sudo rm /usr/share/applications/org.gnome.Extensions.desktop
sudo rm /usr/share/applications/org.gnome.Terminal.desktop
sudo rm /usr/share/applications/org.gnome.Console.desktop
sudo rm /usr/share/applications/org.gnome.Usage.desktop
sudo rm /usr/share/applications/org.gnome.SystemMonitor.desktop
sudo rm /usr/share/applications/qv4l2.desktop
sudo rm /usr/share/applications/qvidcap.desktop
sudo rm /usr/share/applications/stoken-gui.desktop
sudo rm /usr/share/applications/stoken-gui-small.desktop
sudo rm /usr/share/applications/xterm.desktop
sudo rm /usr/share/applications/uxterm.desktop
sudo rm /usr/share/applications/yad-icon-browser.desktop
sudo rm /usr/share/applications/yad-settings.desktop

echo "Installing GTK theme..."
cd $HOME
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git
./Catppuccin-GTK-Theme/themes/install.sh -l -t purple --tweaks macos float
rm -rf ./Catppuccin-GTK-Theme

echo "Installing Tela icon theme..."
cd $HOME
git clone https://github.com/vinceliuice/Tela-icon-theme.git
./Tela-icon-theme/install.sh dracula -d $HOME/.icons
rm -rf ./Tela-icon-theme
