# === HOMEBREW

# Load Homebrew
if [[ "$(uname -s)" == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ "$(uname -s)" == "Darwin" ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Load completions from installed formulae (including v1 completions)
export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"
[[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]] &&
  source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
