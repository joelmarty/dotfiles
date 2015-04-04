

#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#

HISTFILE=~/.zsh_history
SAVEHIST=1000

# touches de commandes
bindkey -v
#bindkey "\e[H" beginning-of-line # Début
#bindkey "\e[F" end-of-line # Fin
#bindkey "\e[3~" delete-char
bindkey "^R" history-incremental-search-backward # Recherche
#bindkey -M vicmd '?' history-incremental-search-backward
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
 
# Complétion 
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
 
# Correction des commandes
setopt correctall

# history
setopt inc_append_history
 
# prompt minimal avant de charger
autoload -U promptinit
promptinit
prompt off
[[ $- = *i* ]] && source /usr/bin/liquidprompt
 
# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lll='ls --color=auto -lh | less'
alias yup='yaourt -Syua'
alias y='yaourt'
alias yin='yaourt -S'
alias yout='yaourt -Rcns'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
export EDITOR=/usr/bin/vim

alias mci='mvn clean install'
alias mcist='mci -DskipTests'

alias gpl='git pull'

alias gplr='git pull --rebase'
alias gph='git push'
alias gs='git st'
