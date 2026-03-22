#!/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

yay -S --needed $(cat ./dependencies)

cd files
stow . -t $HOME --verbose



ln -sf "$HOME/.config/zsh/.zshrc" "$HOME/.zshrc"

