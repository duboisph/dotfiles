#!/usr/bin/env bash

# === SHELL OPTIONS

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable autocd, eg `**/qux` will enter `./foo/bar/baz/qux`
shopt -s autocd

# Enable recursive globbing, eg. `echo **/*.txt`
shopt -s globstar

# Disable annoying bell
bind "set bell-style visible"


# === EXPORTS

# Include $HOME/bin to the PATH
export PATH="$HOME/bin:$PATH"

# Make vim the default editor
export EDITOR='vim'

# Increase Bash history size. Allow 32³ entries; the default is 500
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
# Omit duplicates and commands that begin with a space from history
export HISTCONTROL='ignoreboth'
# Make some commands not show up in history
export HISTIGNORE='ls:cd:cd -:pwd:exit:date:history:* --help'

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Highlight section titles in manual pages
LESS_TERMCAP_md=$(tput setaf 3)
export LESS_TERMCAP_md

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr
export PYTHONIOENCODING='UTF-8'


# === LOADING

# Load extra configs
for file in ${HOME}/.bash_profile.d/*.sh; do
  [ -r "$file" ] && source "$file"
done

# Load extra completions
for file in ${HOME}/.bash_completion.d/*; do
  [ -r "$file" ] && source "$file"
done

unset file
