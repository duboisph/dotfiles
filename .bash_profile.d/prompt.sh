#!/usr/bin/env bash

# === BASH PROMPT

# Enable 256 color support
#if infocmp xterm-256color >/dev/null 2>&1; then
#  export TERM='xterm-256color'
#fi

# Determine git status from the current directory
__prompt_git() {
  local s=''
  local branch=''

  # Check if the current directory is in a Git repository.
  if [ "$(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}")" == '0' ]; then
    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then
      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null

      # Check for uncommitted changes in the index.
      if ! (git diff --quiet --ignore-submodules --cached); then
        s+='+'
      fi

      # Check for unstaged changes.
      if ! (git diff-files --quiet --ignore-submodules --); then
        s+='!'
      fi

      # Check for untracked files.
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?'
      fi

      # Check for stashed files.
      if (git rev-parse --verify refs/stash &>/dev/null); then
        s+='$'
      fi
    fi

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # Otherwise, just give up.
    branch="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
      git rev-parse --short HEAD 2> /dev/null || \
      echo '(unknown)')"

    echo -e "${1}${branch}${s}${2}"
  else
    return
  fi
}

# Determine terraform workspace from the current directory
__prompt_tf() {
  local workspace=''

  # Check if the current directory is a Terraform project
  if [ -d "${PWD}/.terraform" ]; then
    workspace="$(terraform workspace show 2> /dev/null)"
    echo -e "${1}${workspace}${2}"
  else
    return
  fi
}

# Determine current kubectl context
__prompt_kube() {
  local context=''

  # Check if we have a kubectl config
  if [ -f "${HOME}/.kube/config" ]; then
    context="$(kubectl config current-context 2> /dev/null)"
    echo -e "${1}${context}${2}"
  else
    return
  fi
}


reset="\e[0m"
black="\e[0;30m"
red="\e[0;31m"
green="\e[0;32m"
yellow="\e[0;33m"
blue="\e[0;34m"
magenta="\e[0;35m"
cyan="\e[0;36m"
white="\e[0;37m"
brightblack="\e[1;30m"
brightred="\e[1;31m"
brightgreen="\e[1;32m"
brightyellow="\e[1;33m"
brightblue="\e[1;34m"
brightmagenta="\e[1;35m"
brightcyan="\e[1;36m"
brightwhite="\e[1;37m"

# Highlight the user name when logged in as root.
if [[ ${EUID} == 0 ]]; then
  usercolor="${red}"
else
  usercolor="\[${magenta}\]"
fi

# Set the terminal title and prompt
PS1="\[\033]0;\W\007\]" # working directory (title)
PS1+="\n"
#PS1+="${usercolor}\u" # username
#PS1+="\[${brightmagenta}\]@\h" # @hostname
#PS1+="\[${white}\] ("
PS1+="\[${brightcyan}\]\w" # working directory
PS1+="\$(__prompt_git \" \[${brightblue}\](\[${brightmagenta}\]\" \"\[${brightblue}\])\")" # git details
PS1+="\$(__prompt_tf \" \[${brightblue}\][workspace \[${brightmagenta}\]\" \"\[${brightblue}\]]\")" # tf details
PS1+="\$(__prompt_kube \" \[${brightblue}\][k8s \[${brightmagenta}\]\" \"\[${brightblue}\]]\")" # k8s details
#PS1+="\[${white}\])"
PS1+="\n"
PS1+="${usercolor}\$ \[${reset}\]" # `$`
export PS1

PS2="\[${magenta}\]→ \[${reset}\]"
export PS2
