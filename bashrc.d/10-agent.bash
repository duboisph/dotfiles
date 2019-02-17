# === GPG-AGENT
eval "$(gpg-agent --daemon 2> /dev/null)"
GPG_TTY="$(tty)"
export GPG_TTY

# === SSH-AGENT
# https://help.github.com/articles/working-with-ssh-key-passphrases

env="${HOME}/.ssh/agent.env"
ttl=14400

agent_load_env () {
  [[ -f "${env}" ]] && source "${env}" >| /dev/null
}

agent_start () {
  (umask 077; ssh-agent -t ${ttl} >| "${env}")
  source "${env}" >| /dev/null
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [[ ! "${SSH_AUTH_SOCK}" ]] || [[ ${agent_run_state} -eq 2 ]]; then
  agent_start
fi

# Cleanup
unset -v env
unset -v ttl
unset -v agent_run_state
unset -f agent_load_env
unset -f agent_start
