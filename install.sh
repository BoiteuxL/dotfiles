#!/bin/bash

LOG_SECTION='\033[34;1m'
LOG_COMMAND='\033[33;1m'
CLEAR='\033[0m' # Reset color

function log_section() {
    echo -e "${LOG_SECTION}$1${CLEAR}"
}

function log_command() {
    echo -e "${LOG_COMMAND}$1${CLEAR}"
}

# Start script
cd $HOME
echo -e "${LOG_SECTION}Cloning dotfiles repository...${CLEAR}"
git clone https://github.com/BoiteuxL/dotfiles.git --quiet
cd dotfiles

# Install packages and apps
log_section "Packages and appplications"
yay -Sy --noconfirm --quiet zsh ptyxis visual-studio-code-bin htop extension-manager gtk-engine-murrine cmatrix pipes.sh fastfetch teams-for-linux firefox starship gnome-extensions-cli ttf-jetbrains-mono-nerd ttf-hack-nerd ttf-segoe-ui-variable

# =============================================
# ZSH Configuration
# =============================================
log_command "Configuring ZSH..."
sudo chsh $USER -s /bin/zsh

# =============================================
# Installing Catppuccin GTK theme and Tela icon theme
# =============================================
log_section "GTK theme and icons"

log_command "Cloning Catppuccin GTK theme repository..."
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git --quiet
log_command "Running installation script for Catppuccin GTK theme..."
./Catppuccin-GTK-Theme/themes/install.sh -l -t purple --tweaks macos float
log_command "Cleaning up..."
rm -rf ./Catppuccin-GTK-Theme

log_command "Cloning Tela icon theme repository..."
git clone https://github.com/vinceliuice/Tela-icon-theme.git --quiet
log_command "Running installation script for Tela icon theme..."
./Tela-icon-theme/install.sh dracula -d $HOME/.icons
log_command "Cleaning up..."
rm -rf ./Tela-icon-theme


# =============================================
# Import Gnome settings + extensions
# =============================================

# Import Gnome extensions
log_section "Gnome extensions"
./scripts/extensions/install_extensions.sh
./scripts/extensions/setup_extensions.sh

# Import Gnome settings
log_section "Gnome settings"
./scripts/gnome/setup_gnome.sh
# Import Gnome shortcuts
log_command "Importing keyboard shortcuts..."
./scripts/gnome/setup_shortcuts.sh


# =============================================
# Cleanup unused .desktop shortcuts
# =============================================
log_section ".desktop shortcuts"
./scripts/gnome/remove_desktop.sh

# =============================================
# Copy dotfiles to home directory
# =============================================

cd ./files
log_section "Configuration files"
find ${pwd} -type f -exec cp --parents {} $HOME \;  -exec echo -e "${LOG_COMMAND}Copied:${CLEAR} {}" \; 


log_command "Cleaning up..."
cd $HOME
rm -r ./dotfiles

echo -e "${LOG_SECTION}Done!${CLEAR}"