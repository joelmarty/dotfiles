# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# activate 256 colors
export TERM="xterm-256color"

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
#export ZSH_THEME="bira"
#export ZSH_THEME="funky"
#export ZSH_THEME="jnrowe"
#export ZSH_THEME="pmcgee"
export ZSH_THEME="sporty_256"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git command-not-found vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/joel/Programmes/gsutil:/home/joel/Softs/Java/play-1.1

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=10000

bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[7~" beginning-of-line
bindkey "\e[8~" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\eOd" backward-word
bindkey "\eOc" forward-word

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#shortcut to live syslog
alias syslog='tail -f /var/log/syslog'

function to () {
   if test "$2"; then
     cd "$(apparix "$1" "$2" || echo .)";
   else
     cd "$(apparix "$1" || echo .)";
   fi
   pwd
}
function bm () {
   if test "$2"; then
      apparix --add-mark "$1" "$2";
   elif test "$1"; then
      apparix --add-mark "$1";
   else
      apparix --add-mark;
   fi
}
function portal () {
   if test "$1"; then
      apparix --add-portal "$1";
   else
      apparix --add-portal;
   fi
}
