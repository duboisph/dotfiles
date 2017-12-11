#!/usr/bin/env bash

# === LOADING

# Load the shell dotfiles
for file in ~/.{bash_profile.local,bash_prompt,bash_aliases,bash_wsl}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file


# === EXPORTS

export PATH="$HOME/bin:$PATH"

# Make vim the default editor
export EDITOR='vim'

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr
export PYTHONIOENCODING='UTF-8'

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


# === SHELL OPTIONS

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
  shopt -s "$option" 2> /dev/null
done

# Disable annoying bell
#setterm -blength 0
bind "set bell-style visible"


# === COMPLETION

# Add tab completion
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[[ -f "$HOME/.ssh/config" ]] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for kubectl
[[ $(which kubectl) ]] && source <(kubectl completion bash)


# === GPG-AGENT
# https://wiki.archlinux.org/index.php/GnuPG#gpg-agent

# Start the GPG agent if it isn't running already
if [ -n "$(pgrep gpg-agent)" ]; then
  GPG_TTY=$(tty)
  export GPG_TTY
else
  eval "$(gpg-agent --daemon)"
fi

# Use gpg-agent with ssh-agent emulation
# Don't forget to add your SSH keys the first time with ssh-add(1)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi
