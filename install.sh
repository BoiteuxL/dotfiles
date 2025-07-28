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
log_command "Installing packages and applications using yay..."
yay -Sy --noconfirm --quiet zsh visual-studio-code-bin htop extension-manager gtk-engine-murrine cmatrix pipes.sh fastfetch teams-for-linux firefox starship gnome-extensions-cli ttf-jetbrains-mono-nerd ttf-hack-nerd ttf-segoe-ui-variable ttf-clear-sans ttf-atkinson-hyperlegible

# =============================================
# ZSH Configuration
# =============================================
log_command "Configuring ZSH..."
sudo chsh $USER -s /bin/zsh

# =============================================
# Installing Catppuccin GTK theme and Tela icon theme
# =============================================
log_section "Installing GTK theme, icon pack and sound pack..."

# Clone and install Catppuccin GTK theme
log_command "Cloning Catppuccin GTK theme repository..."
git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git --quiet
log_command "Running installation script..."
./Catppuccin-GTK-Theme/themes/install.sh -l -t purple --tweaks macos float
log_command "Cleaning up..."
rm -rf ./Catppuccin-GTK-Theme

# Clone and install Catppuccin GNOME Terminal theme
log_command "Installing Catppuccin GNOME Terminal theme..."
curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -

# Clone and install Tela icon theme
log_command "Cloning Tela icon pack repository..."
git clone https://github.com/vinceliuice/Tela-icon-theme.git --quiet
log_command "Running installation script..."
./Tela-icon-theme/install.sh dracula -d $HOME/.icons
log_command "Cleaning up..."
rm -rf ./Tela-icon-theme

# Clone and install MinimalUI sound pack
log_command "Cloning MinimalUI sound pack repository..."
mkdir -p ~/.local/share/sounds
cd $HOME/.local/share/sounds
git clone https://github.com/cadecomposer/modern-minimal-ui-sounds.git --quiet
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
rm -r ./dotfiles

echo -e "${LOG_SECTION}Done!${CLEAR}"
