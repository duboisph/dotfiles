# === WSL SPECIFIC WORKAROUNDS
if grep -q Microsoft /proc/version; then
  # Set correct umask
  # https://github.com/Microsoft/WSL/issues/352
  [[ "$(umask)" == '0000' ]] && umask 022

  # Set browser to Chrome
  export DISPLAY=':0'
  export BROWSER='/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe'

  # Connect to the Windows Docker daemon over TCP
  export DOCKER_HOST='tcp://0.0.0.0:2375'
fi
