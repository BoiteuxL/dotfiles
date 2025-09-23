#!/bin/bash

LOG_SECTION='\033[34;1m'
LOG_ITEM='\033[35;1m'
LOG_COMMAND='\033[33;1m'
CLEAR='\033[0m' # Reset color

function log_section() {
    echo -e "${LOG_SECTION}$1${CLEAR}"
}

function log_item() {
    echo -e "${LOG_ITEM}$1${CLEAR}"
}

function log_command() {
    echo -e "${LOG_COMMAND}$1${CLEAR}"
}


# Clone and install Catppuccin GTK theme
read -p "Do you want to install the Catppuccin GTK theme? (y/n): " install_theme
if [[ "$install_theme" =~ ^[Yy]$ ]]; then
    log_command "Cloning Catppuccin GTK theme repository..."
    git clone https://github.com/Fausto-Korpsvart/Catppuccin-GTK-Theme.git --quiet
    log_command "Running installation script..."
    ./Catppuccin-GTK-Theme/themes/install.sh -l -t purple --tweaks macos float
    log_command "Cleaning up..."
    rm -rf ./Catppuccin-GTK-Theme

    # Clone and install Catppuccin GNOME Terminal theme
    log_command "Installing Catppuccin GNOME Terminal theme..."
    curl -L https://raw.githubusercontent.com/catppuccin/gnome-terminal/v1.0.0/install.py | python3 -
fi



# Clone and install Tela icon theme
read -p "Do you want to install the Tela icon theme? (y/n): " install_icons
if [[ "$install_icons" =~ ^[Yy]$ ]]; then
    log_command "Cloning Tela icon pack repository..."
    git clone https://github.com/vinceliuice/Tela-icon-theme.git --quiet
    log_command "Running installation script..."
    ./Tela-icon-theme/install.sh dracula -d $HOME/.icons
    log_command "Cleaning up..."
    rm -rf ./Tela-icon-theme
fi

# Clone and install MinimalUI sound pack
read -p "Do you want to install the MinimalUI sound pack? (y/n): " install_sounds
if [[ "$install_sounds" =~ ^[Yy]$ ]]; then
    log_command "Cloning MinimalUI sound pack repository..."
    mkdir -p ~/.local/share/sounds
    cd $HOME/.local/share/sounds
    git clone https://github.com/cadecomposer/modern-minimal-ui-sounds.git --quiet
    cd $HOME/dotfiles
fi