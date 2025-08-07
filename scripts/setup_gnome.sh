#!/bin/bash

LOG_SECTION='\033[34;1m'
LOG_ITEM='\033[36;1m'
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

# Gnome
log_command "Importing up UI settings..."
# Themes and icons
gsettings set org.gnome.desktop.interface monospace-font-name "Hack Nerd Font 11"
gsettings set org.gnome.desktop.interface document-font-name "Atkinson Hyperlegible 11"
gsettings set org.gnome.desktop.interface font-name "Clear Sans 11"
gsettings set org.gnome.desktop.interface icon-theme "Tela-dracula-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Purple-Dark"
gsettings set org.gnome.desktop.sound theme-name "modern-minimal-ui-sounds"
gsettings set org.gnome.desktop.wm.preferences button-layout "appmenu:minimize,close"
# Colours
gsettings set org.gnome.desktop.interface accent-color "purple"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
# Clock
gsettings set org.gnome.desktop.interface clock-format "24h"
gsettings set org.gnome.desktop.interface clock-show-date false
gsettings set org.gnome.desktop.interface clock-show-seconds false
gsettings set org.gnome.desktop.interface clock-show-weekday false
# Other
gsettings set org.gnome.desktop.interface enable-animations true
gsettings set org.gnome.desktop.interface show-battery-percentage true

# Workspace
log_command "Importing workspace settings..."
# Window management
gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'none'
gsettings set org.gnome.desktop.interface locate-pointer true
gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.mutter edge-tiling false
# Workspaces
gsettings set org.gnome.mutter workspaces-only-on-primary true
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5
gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'librewolf.desktop', 'obsidian.desktop', 'code.desktop', 'teams-for-linux.desktop', 'org.gnome.Settings.desktop']"
# Mouse/Touchpad/Keyboard
gsettings set org.gnome.desktop.peripherals.touchpad two-finger-scrolling-enabled true

log_command "Setting up weather location..."
gsettings set org.gnome.shell.weather locations "[<(uint32 2, <('Quebec', 'CYQB', false, [(0.81681408993334614, -1.2458741918975214)], @a(dd) [])>)>]"
