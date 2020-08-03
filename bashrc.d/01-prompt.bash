# === BASH PROMPT

readonly PROMPT_SYMBOL="❯"
readonly PROMPT_SYMBOL_GIT_DIRTY="*"
readonly PROMPT_SYMBOL_GIT_STASH="$"

export PROMPT_DIRTRIM=5

# Determine git status
__prompt_git() {
  local branch
  local status

  # Check if the current directory is in a Git repository
  if [[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]]; then
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    branch="$(command git symbolic-ref --quiet --short HEAD 2>/dev/null || \
              command git rev-parse --short HEAD 2> /dev/null)"

    # Check for untracked or uncommitted files
    if [[ -n $(command git status --porcelain --ignore-submodules -unormal 2>/dev/null) ]]; then
      status+="${PROMPT_SYMBOL_GIT_DIRTY}"
    fi

    # Check for stashed files
    if (command git rev-parse --verify refs/stash &>/dev/null); then
      status+="${PROMPT_SYMBOL_GIT_STASH}"
    fi

    echo -e " ${branch}${status}"
  fi
}

# Determine terraform workspace
__prompt_tf() {
  local workspace

  if [[ -d "${PWD}/.terraform" ]]; then
    workspace="$(command terraform workspace show 2> /dev/null)"
    echo -e " ${workspace}"
  fi
}

__prompt_command() {
  local -r EXIT="$?"
  local -r RESET="\[\e[0m\]"
  local -r BLACK="\[\e[0;30m\]"
  local -r RED="\[\e[0;31m\]"
  local -r GREEN="\[\e[0;32m\]"
  local -r YELLOW="\[\e[0;33m\]"
  local -r BLUE="\[\e[0;34m\]"
  local -r MAGENTA="\[\e[0;35m\]"
  local -r CYAN="\[\e[0;36m\]"
  local -r LIGHT_GRAY="\[\e[0;37m\]"
  local -r DEFAULT="\[\e[0;39m\]"
  local -r DARK_GRAY="\[\e[0;90m\]"
  local -r LIGHT_RED="\[\e[0;91m\]"
  local -r LIGHT_GREEN="\[\e[0;92m\]"
  local -r LIGHT_YELLOW="\[\e[0;93m\]"
  local -r LIGHT_BLUE="\[\e[0;94m\]"
  local -r LIGHT_MAGENTA="\[\e[0;95m\]"
  local -r LIGHT_CYAN="\[\e[0;96m\]"
  local -r WHITE="\[\e[0;97m\]"
  local -r BOLD_BLACK="\[\e[1;30m\]"
  local -r BOLD_RED="\[\e[1;31m\]"
  local -r BOLD_GREEN="\[\e[1;32m\]"
  local -r BOLD_YELLOW="\[\e[1;33m\]"
  local -r BOLD_BLUE="\[\e[1;34m\]"
  local -r BOLD_MAGENTA="\[\e[1;35m\]"
  local -r BOLD_CYAN="\[\e[1;36m\]"
  local -r BOLD_LIGHT_GRAY="\[\e[1;37m\]"
  local prompt_color

  # Highlight the prompt symbol when the previous command exited with an error
  if [[ $EXIT -eq 0 ]]; then
    prompt_color="${MAGENTA}"
  else
    prompt_color="${RED}"
  fi

  # Set the terminal title and prompt
  PS1="\[\033]2;\W\007\]"
  PS1+="\n${BLUE}\w${DARK_GRAY}$(__prompt_git)${CYAN}$(__prompt_tf)"
  PS1+="\n${prompt_color}${PROMPT_SYMBOL}${RESET} "

  PS2="${prompt_color}${PROMPT_SYMBOL}${RESET} "
}

PROMPT_COMMAND="__prompt_command"
