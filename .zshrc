

#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#

HISTFILE=~/.zsh_history
SAVEHIST=1000
 
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle git-extras
antigen bundle history
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle docker
antigen bundle npm
antigen bundle systemd
antigen bundle thefuck
antigen bundle vi-mode
antigen bundle z
antigen bundle sudo
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle mvn

# zsh-nvm handles nvm updates and stuff
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm

# theme
antigen theme agnoster

antigen apply
