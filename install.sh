#!/bin/bash

LOG_SECTION='\033[34;1m'
LOG_COMMAND='\033[33;1m'
CLEAR='\033[0m' # Reset color

run_in_file() {
    local file="$1"
    local cmd="$2"
    while IFS= read -r line; do
        if [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]]; then
            continue
        fi
        echo -e "${LOG_COMMAND}Running:${CLEAR} ${cmd} $line"
        eval "${cmd} $line"
    done < "$file"
}


cd $HOME
echo -e "${LOG_SECTION}Cloning dotfiles repository...${CLEAR}"
git clone https://github.com/BoiteuxL/dotfiles.git
cd dotfiles

# Install packages and apps
echo -e "${LOG_SECTION}Installing packages and apps...${CLEAR}"
echo -e "${LOG_COMMAND}Running:${CLEAR} yay -Sy --noconfirm --quiet"
yay -Syu $(cat packages | cut -d' ' -f1) --noconfirm --quiet

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


# =============================================
# Import Gnome settings + extensions
# =============================================
cd $HOME
cd ./dotfiles

# Import Gnome extensions
echo -e "${LOG_SECTION}Installing Gnome extensions...${CLEAR}"
run_in_file "extensions" "gext install"

# Import keyboard shortcuts
echo -e "${LOG_SECTION}Importing keyboard shortcuts...${CLEAR}"
run_in_file "shortcuts" "gsettings set"

# Import Gnome settings
echo -e "${LOG_SECTION}Importing Gnome settings...${CLEAR}"
sudo cp $HOME/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas
run_in_file "settings" "gsettings set"


# Remove file to exclude from mass copy
rm -f ./README.md
rm -f ./LICENSE
rm -f ./install.sh
rm -f ./shortcuts
rm -f ./packages
rm -f ./extensions
rm -f ./settings
rm -f ./desktop
rm -rf ./.git

# =============================================
# Copy dotfiles to home directory
# =============================================
cd $HOME
cd ./dotfiles
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
run_in_file "desktop" "sudo rm"

echo -e "${LOG_SECTION}Done!${CLEAR}"