#!/usr/bin/env bash

# === WSL SPECIFIC WORKAROUNDS

if grep -q Microsoft /proc/version; then
  # Set correct umask
  # https://github.com/Microsoft/WSL/issues/352
  [[ "$(umask)" == '0000' ]] && umask 022

  # Set browser to Chrome
  # https://stackoverflow.com/questions/41404536/why-is-bash-wsl-using-w3m-as-its-default-browser
  export DISPLAY=:0
  export BROWSER=/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe

  # Allow to run vagrant from inside WSL
  # https://www.vagrantup.com/docs/other/wsl.html
  export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
fi
