# === HOMEBREW

# Load Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load completions from installed formulae (including v1 completions)
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh" ]] &&
  source "/home/linuxbrew/.linuxbrew/etc/profile.d/bash_completion.sh"
