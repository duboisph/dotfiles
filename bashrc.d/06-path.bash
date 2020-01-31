if [[ "$(uname -s)" == "Darwin" ]]; then
  PATH="${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin:$PATH"
fi

PATH="$HOME/bin:$PATH"
PATH="$HOME/.krew/bin/:$PATH"
export PATH
