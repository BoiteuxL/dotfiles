
# Yay Aliases
# alias yay='yay'

alias yayi='yay -S'
alias yayr='yay -Rns'
alias yayma='sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist && yay -Syyu'
alias yayme='sudo eos-rankmirrors --verbose && yay -Syyu'
