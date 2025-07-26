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
log_command "Setting up weather location..."
gsettings set org.gnome.shell.weather locations "[<(uint32 2, <('Quebec', 'CYQB', false, [(0.81681408993334614, -1.2458741918975214)], @a(dd) [])>)>]"

log_command "Setting up UI settings..."
gsettings set org.gnome.desktop.interface monospace-font-name "Hack Nerd Font 11"
gsettings set org.gnome.desktop.interface icon-theme "Tela-dracula-dark"
gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Purple-Dark"