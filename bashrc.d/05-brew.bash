# Load Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load completions from installed formulae
for file in "$(brew --prefix)"/etc/bash_completion.d/*; do
  [[ -r "$file" ]] && source "$file"
done

unset file
