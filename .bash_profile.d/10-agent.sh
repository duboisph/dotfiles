#!/usr/bin/env bash

# === GPG-AGENT
# https://wiki.archlinux.org/index.php/GnuPG#gpg-agent

# Start the GPG agent
eval "$(gpg-agent --daemon 2> /dev/null)"
export GPG_TTY=$(tty)


# === SSH-AGENT
# https://help.github.com/articles/working-with-ssh-key-passphrases

env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
  (umask 077; ssh-agent >| "$env")
  . "$env" >| /dev/null
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
  agent_start
fi

unset env
unset agent_run_state
