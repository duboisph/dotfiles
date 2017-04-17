#!/usr/bin/env bash

# === LS

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  lsflags="--color --group-directories-first"
  export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
  lsflags="-G"
  export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi

alias ll="ls -hlF ${lsflags}"
alias la="ls -hlaF ${lsflags}"
alias ls="ls -hF ${lsflags}"


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
alias screen='screen -U'
alias fuser='fuser -v'
alias vi='nvim'
alias vim='nvim'


# === COMMANDS

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Processes
alias psa="ps aux"
alias psg="ps aux | grep "

# IP address
 alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Update the system
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; gem update --system; gem update; gem cleanup'

# Flush DNS cache
alias flush='sudo killall -HUP mDNSResponder'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Show/hide hidden files in Finder
alias show='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
alias hide='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Reload the shell (i.e. invoke as a login shell)
alias reload='exec $SHELL -l'
