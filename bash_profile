# === GENERAL OPTIONS

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths in the prompt (requires Bash 4.x)
# PROMPT_DIRTRIM=2

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Disable annoying bell
bind 'set bell-style visible'


# === SANE HISTORY DEFAULTS

# Append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Increase Bash history size (default 500)
HISTSIZE=5000
HISTFILESIZE="${HISTSIZE}"

# Avoid duplicate entries
HISTCONTROL='erasedups:ignoreboth'

# Don't record some commands
HISTIGNORE='&:[ ]*:exit:ls:bg:fg:history:clear:cd:cd -:pwd:date:* --help:* help'

# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
HISTTIMEFORMAT='%F %T '

# Enable incremental history search with up/down arrows (also Readline goodness)
# Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'


# === BETTER DIRECTORY NAVIGATION

# Prepend cd to directory names automatically
shopt -s autocd

# Correct spelling errors during tab-completion
shopt -s dirspell

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars
export dotfiles="$HOME./dotfiles"
export projects="$HOME/projects"
export skyscrapers="$HOME/skyscrapers"


# === MISC SETTINGS

# Make nvim the default editor
export EDITOR='nvim'

# Prefer US English and use UTF-8
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Highlight section titles in manual pages
LESS_TERMCAP_md="$(tput setaf 3)"
export LESS_TERMCAP_md


# === LOADING

# Load extra configs
for file in "$HOME"/.bashrc.d/*.bash; do
  [[ -r "$file" ]] && source "$file"
done

# Load extra completions
for file in "$HOME"/.bash_completion.d/*; do
  [[ -r "$file" ]] && source "$file"
done

unset file
