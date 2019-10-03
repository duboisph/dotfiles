# === WSL SPECIFIC WORKAROUNDS
if [[ "$(uname -s)" == "Darwin" ]]; then
  # Set browser to Chrome
  export DISPLAY=':0'
  export BROWSER='/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
fi
