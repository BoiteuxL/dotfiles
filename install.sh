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

log_section "Starting installation script..."
cd $HOME
log_command "Cloning dotfiles repository..."
git clone https://github.com/BoiteuxL/dotfiles.git --quiet
cd dotfiles

# Install packages and apps
log_command "Installing packages and applications..."


yay -Sy --noconfirm --quiet zsh visual-studio-code-bin htop librewolf-bin endeavouros/paru extension-manager gtk-engine-murrine cmatrix pipes.sh fastfetch teams-for-linux firefox starship gnome-extensions-cli ttf-jetbrains-mono-nerd ttf-hack-nerd ttf-segoe-ui-variable ttf-clear-sans ttf-atkinson-hyperlegible

# =============================================
# ZSH Configuration
# =============================================
log_command "Configuring ZSH..."
sudo chsh $USER -s /bin/zsh


# =============================================
# Installing Catppuccin GTK theme and Tela icon theme
# =============================================
./scripts/theme_catppuccin.sh
cd $HOME/dotfiles



# =============================================
# Import Gnome settings + extensions
# =============================================

# Import Gnome extensions
log_section "Installing Gnome extensions..."
./scripts/setup_extensions.sh

# Import Gnome settings
log_section "Importing Gnome settings..."
./scripts/setup_gnome.sh
# Import Gnome shortcuts
log_command "Importing keyboard shortcuts..."
./scripts/setup_shortcuts.sh



# =============================================
# Cleanup unused .desktop shortcuts
# =============================================
log_section "Removing .desktop shortcuts..."
./scripts/remove_desktop.sh

# =============================================
# Copy dotfiles to home directory
# =============================================

cd ./files
log_section "Copying configuration files..."
find . -type f -exec ../scripts/copy_file.sh {} \;

log_command "Cleaning up..."
cd $HOME
sudo rm -rf ./dotfiles

echo -e "${LOG_SECTION}Done!${CLEAR}"


echo -e "${LOG_COMMAND}Please restart your computer to apply all changes.${CLEAR}"
