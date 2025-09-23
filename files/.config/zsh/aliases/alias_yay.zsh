
# Yay Aliases

# paru
alias parui='paru -Syy'
alias parur='paru -Rns'
alias paruma='sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist && paru -Syyu'
alias parume='sudo eos-rankmirrors --verbose && paru -Syyu'
alias paruclean='paru -Rns $(paru -Qdtq)'

# DNF Aliases
alias dnfu='sudo dnf upgrade --refresh -y'
alias dnfi='sudo dnf install -y'
alias dnfr='sudo dnf remove -y'
alias dnfsearch='dnf search'
alias dnfinfo='dnf info'
alias dnfclean='sudo dnf autoremove -y && sudo dnf clean all'