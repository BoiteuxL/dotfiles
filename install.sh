#!/bin/bash

while IFS= read -r extension; do
    code --install-extension $extension --force
done < vscode-extensions

echo "Running GNU Stow..."
stow .