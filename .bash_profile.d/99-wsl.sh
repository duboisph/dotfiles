#!/usr/bin/env bash

# === WSL SPECIFIC WORKAROUNDS

if grep -q Microsoft /proc/version; then
  # Set correct umask
  # https://github.com/Microsoft/WSL/issues/352
  [[ "$(umask)" == '0000' ]] && umask 022

  # Set browser to Chrome
  # https://stackoverflow.com/questions/41404536/why-is-bash-wsl-using-w3m-as-its-default-browser
  export DISPLAY=:0
  export BROWSER=/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe
fi
