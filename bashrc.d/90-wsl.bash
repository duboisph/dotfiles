# === WSL SPECIFIC WORKAROUNDS
if grep -q Microsoft /proc/version > /dev/null 2>&1; then
  # Set correct umask
  # https://github.com/Microsoft/WSL/issues/352
  [[ "$(umask)" == '0000' ]] && umask 022

  # Set browser to Chrome
  # https://stackoverflow.com/questions/41404536/why-is-bash-wsl-using-w3m-as-its-default-browser
  export DISPLAY=':0'
  export BROWSER='/mnt/c/Program Files (x86)/Microsoft/Edge Dev/Application/msedge.exe'

  # Connect to the Windows Docker daemon over TCP
  export DOCKER_HOST='tcp://localhost:2375'

  # Replace pbcopy by clip.exe, for easy macOS -> Windows copy pasting
  alias pbcopy='clip.exe'
fi
