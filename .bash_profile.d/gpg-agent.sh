#!/usr/bin/env bash

# === GPG-AGENT
# https://wiki.archlinux.org/index.php/GnuPG#gpg-agent

# Start the GPG agent
# It's also used with ssh-agent emulation so don't forget to add your keys the
# first time with ssh-add(1)
unset SSH_AGENT_PID
eval "$(gpg-agent --daemon 2> /dev/null)"
GPG_TTY=$(tty)
export GPG_TTY
