#!/bin/bash

LOG_SECTION='\033[34;1m'
LOG_COMMAND='\033[33;1m'
CLEAR='\033[0m' # Reset color


# =============================================
# Copy dotfiles to home directory
# =============================================
cd $HOME
echo -e "${LOG_SECTION}Cloning dotfiles repository...${CLEAR}"
git clone https://github.com/BoiteuxL/dotfiles.git
cd dotfiles

# Install packages and apps
echo -e "${LOG_SECTION}Installing packages and apps...${CLEAR}"
echo -e "${LOG_COMMAND}Running:${CLEAR} yay -Syu --noconfirm --quiet"
yay -Syu $(cat packages | cut -d' ' -f1) --noconfirm --quiet

# Import keyboard shortcuts
echo -e "${LOG_SECTION}Importing keyboard shortcuts...${CLEAR}"
while IFS= read -r command; do
    echo -e "${LOG_COMMAND}Running:${CLEAR} gsettings set $command"
    eval gsettings set $command
done < "shortcuts"

# =============================================
# Import Gnome settings
# =============================================
echo -e "${LOG_SECTION}Importing Gnome settings...${CLEAR}"
while IFS= read -r command; do
    echo -e "${LOG_COMMAND}Running:${CLEAR} gsettings set $command"
    eval gsettings set $command
done < "settings"

# Remove file to exclude from copy
rm -f ./README.md
rm -f ./LICENSE
rm -f ./install.sh
rm -f ./shortcuts
rm -f ./settings
rm -f ./packages
rm -f ./desktop
rm -rf ./.git

echo -e "${LOG_SECTION}Copying config files...${CLEAR}"
find ${pwd} -type f -exec cp --parents {} $HOME \;  -exec echo -e "${LOG_COMMAND}Copied:${CLEAR} {}" \; 
cd $HOME
echo -e "${LOG_COMMAND}Cleaning up...${CLEAR}"
rm -r ./dotfiles


# =============================================
# ZSH Configuration
# =============================================
echo -e "${LOG_SECTION}Configuring ZSH...${CLEAR}"
sudo chsh $USER -s /bin/zsh


# =============================================
# Cleanup unused .desktop shortcuts
# =============================================
echo -e "${LOG_SECTION}Removing unused .desktop shortcuts...${CLEAR}"
while IFS= read -r filepath; do
    eval sudo rm $filepath
    echo -e "${LOG_COMMAND}Removed:${CLEAR} $filepath"
done < "desktop"


# =============================================
# Installing Catppuccin GTK theme and Tela icon theme
# =============================================
echo -e "${LOG_SECTION}Installing GTK theme...${CLEAR}"
cd $HOME
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git
echo -e "${LOG_COMMAND}Running installation script...${CLEAR}"
./Catppuccin-GTK-Theme/themes/install.sh -l -t purple --tweaks macos float
echo -e "${LOG_COMMAND}Cleaning up...${CLEAR}"
rm -rf ./Catppuccin-GTK-Theme

echo -e "${LOG_SECTION}Installing Tela icon theme...${CLEAR}"
cd $HOME
git clone https://github.com/vinceliuice/Tela-icon-theme.git
echo -e "${LOG_COMMAND}Running installation script...${CLEAR}"
./Tela-icon-theme/install.sh dracula -d $HOME/.icons
echo -e "${LOG_COMMAND}Cleaning up...${CLEAR}"
rm -rf ./Tela-icon-theme