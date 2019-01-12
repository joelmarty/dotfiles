#!/bin/sh

#shortcut to live journal
alias log='journalctl -f'

# personal bin dir
export PATH=${PATH}:/home/joel/bin

# local aliases
source ~/.local_aliases

# functions
# make a ls after a cd.
function cd () {
  builtin cd "$@" && ls
}

