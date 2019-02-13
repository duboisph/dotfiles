#!/usr/bin/env bash

# === HOMEBREW
# Load Linuxbrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Load bash completions (requires bash-completion@2 formula)
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"
for file in $(brew --prefix)/etc/bash_completion.d/*; do
  [ -r "$file" ] && source "$file"
done

