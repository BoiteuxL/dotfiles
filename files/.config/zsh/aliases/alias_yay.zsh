
# Yay Aliases

 alias yay='paru'
alias yayi='paru -S'
alias yayr='paru -Rns'
alias yayma='sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist && paru -Syyu'
alias yayme='sudo eos-rankmirrors --verbose && paru -Syyu'

# paru
alias parui='paru -S'
alias parur='paru -Rns'
alias paruma='sudo reflector --protocol https --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist && paru -Syyu'
alias parume='sudo eos-rankmirrors --verbose && paru -Syyu'
