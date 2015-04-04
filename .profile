#!/bin/sh

#shortcut to live journal
alias log='journalctl -f'

# personal bin dir
export PATH=${PATH}:/home/joel/bin

# personal aliases
alias pacup='sudo pacman -Syu'
alias pacin='sudo pacman -S'
alias pacout='sudo pacman -Rns'
alias pac='pacman -Ss'

alias yup='yaourt -Syu --aur'
alias yin='yaourt -S'
alias yout='yaourt -Rns'
alias y='yaourt -Ss'

# local aliases
source ~/.local_aliases

# functions
# make a ls after a cd.
function cd () {
  builtin cd "$@" && ls
}

