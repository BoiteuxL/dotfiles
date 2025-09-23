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

read -p "Are you using an Arch-based or Fedora-based distribution? (a/f): " distro
if [[ "$distro" =~ ^[Ff]$ ]]; then
    DISTRO="fedora"
elif [[ "$distro" =~ ^[Aa]$ ]]; then
    DISTRO="arch"
else
    log_command "Invalid input. Please enter 'a' for Arch-based or 'f' for Fedora-based."
    log_command "Cleaning up..."
    cd $HOME
    sudo rm -rf ./dotfiles
    exit 1
fi

# Arch-based
if [[ "$DISTRO" == "arch" ]]; then
    yay -Sy --noconfirm --quiet zsh visual-studio-code-bin htop librewolf-bin endeavouros/paru extension-manager gtk-engine-murrine cmatrix pipes.sh fastfetch teams-for-linux firefox starship gnome-extensions-cli ttf-jetbrains-mono-nerd ttf-hack-nerd ttf-segoe-ui-variable ttf-clear-sans ttf-atkinson-hyperlegible
fi

# Fedora-based
if [[ "$DISTRO" == "fedora" ]]; then
    sudo dnf install zsh gtk-murrine-engine cmatrix fastfetch -y
    flatpak install flathub com.mattjakeman.ExtensionManager -y
    flatpak install flathub com.github.IsmaelMartinez.teams_for_linux -y

    # Visual Studio Code
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
    dnf check-update
    sudo dnf install code -y

    echo -e "${LOG_COMMAND}NOTE: You must install the fonts manually. (JetBrainsMono Nerd, Hack Nerd, Atkinson Hyperlegible, Clear Sans)${CLEAR}"
    read -p "Press [Enter] when you have installed the fonts..."
fi

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
