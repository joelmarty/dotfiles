#!/bin/sh

#shortcut to live syslog
alias syslog='tail -f /var/log/messages.log'

# personal bin dir
export PATH=${PATH}:/home/joel/Softs/bin

# personal aliases
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacout='sudo pacman -Rns'
alias pac='pacman -Ss'

alias yup='yaourt -Syu --aur'
alias yin='yaourt -S'
alias yout='yaourt -Rns'
alias y='yaourt -Ss'

source ~/.local_aliases
