#!/usr/bin/env bash

# === LS

alias ll="ls -hlF  --color --group-directories-first"
alias la="ls -hlaF --color --group-directories-first"
alias ls="ls -hF   --color --group-directories-first"


# === DEFAULTS

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iav'
alias df='df -h'
alias free='free -m'
alias ping='ping -c 5'
alias fuser='fuser -v'
alias vi='nvim'
alias vim='nvim'
alias vagrant='vagrant --color'


# === COMMANDS

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Processes
alias psa="ps aux"
alias psg="ps aux | grep "

# IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Update the system
alias update='sudo apt update && sudo apt dist-upgrade'

# Reload the shell (i.e. invoke as a login shell)
alias reload='exec $SHELL -l'
