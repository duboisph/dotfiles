# Set umask
umask 0007

# Commands to run in interactive sessions
if status is-interactive
  # Remove greeting message
  set -g fish_greeting

  # Indicate 24-bit color support
  set -gx COLORTERM truecolor

  # Prefer US English and use UTF-8
  set -gx LANG en_US.UTF-8
  set -gx LC_ALL en_US.UTF-8

  # Make nvim the default editor
  set -gx EDITOR nvim

  # Settings for aws-vault
  set -gx AWS_VAULT_PROMPT ykman
  set -gx YKMAN_OATH_CREDENTIAL_NAME SkyscrapersAdmin

  # Settings for GPG
  set -gx GPG_TTY (tty)

  # Load Homebrew
  # eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  set -gx HOMEBREW_NO_ENV_HINTS
  eval (/opt/homebrew/bin/brew shellenv)

  # Load Starship Prompt
  starship init fish | source

  # Update PATH
  fish_add_path --prepend --move $HOME/bin $HOME/.local/bin $HOME/.krew/bin/ /opt/homebrew/opt/gnu-sed/libexec/gnubin

  # Load completions
  if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
  end
  if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
  end

  for file in ~/.config/fish/completions/*.fish
    source $file
  end
end
