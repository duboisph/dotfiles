# Set umask
umask 0007

# Prefer US English and use UTF-8
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# Make nvim the default editor
set -gx EDITOR nvim

# Settings for GPG
set -gx GPG_TTY (tty)

# Load Homebrew
set -gx HOMEBREW_NO_ENV_HINTS 1
set -gx HOMEBREW_NO_ANALYTICS 1
if test (uname -s) = Darwin
    set -gx HOMEBREW_PREFIX /opt/homebrew
else if test (uname -s) = Linux
    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
end
if test -d $HOMEBREW_PREFIX
    eval ($HOMEBREW_PREFIX/bin/brew shellenv)
end

# Update PATH
if test (uname -s) = Darwin
    and test -d $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin
    fish_add_path --prepend --move $HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin
end
fish_add_path --prepend --move $HOME/bin

# Load completions
if test -d "$HOMEBREW_PREFIX/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path $HOMEBREW_PREFIX/share/fish/completions
end
if test -d "$HOMEBREW_PREFIX/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path $HOMEBREW_PREFIX/share/fish/vendor_completions.d
end

for file in ~/.config/fish/completions/*.fish
    source $file
end

# Commands to run in interactive sessions only (like terminal)
if status is-interactive
    # Remove greeting message
    set -g fish_greeting

    # Indicate 24-bit color support
    set -gx COLORTERM truecolor

    # Load theme
    fish_config theme choose "Dracula Official"

    # Load Starship Prompt
    starship init fish | source
end
