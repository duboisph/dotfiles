# === ALIASES

# ls
lsflags="--group-directories-first --color"
export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
#alias ll="ls -hlF ${lsflags}"
#alias la="ls -hlaF ${lsflags}"
#alias ls="ls -hF ${lsflags}"

alias ll="exa -lgh --icons"
alias la="exa -lgha --icons"

# defaults
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mv='mv -iv'
alias rm='rm -iv'
alias cp='cp -iav'
alias df='df -h'
alias free='free -m'
alias fuser='fuser -v'
alias ping='ping -c 5'

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  alias vi='nvim'
fi

# Enable aliases to be sudo’ed
alias sudo='sudo '

# IP address
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

# Update the system
alias update='sudo apt update && sudo apt full-upgrade && sudo apt autopurge -y; brew upgrade'

# Reload the shell (i.e. invoke as a login shell)
alias reload='exec $SHELL -l'

# Passwords!
gen-password() { openssl rand -base64 ${1:-16}; }

# Shortcuts
alias kc='kubectl'
alias kube-dashboard='kubectl auth-proxy -n kubernetes-dashboard https://kubernetes-dashboard.svc'
alias awslogin='aws-vault login'

tshl () {
  if [ "$1" != "" ]; then
    # Login to customer cluster
    KUBECONFIG=/dev/null tsh login $@
  else
    # Login to main cluster
    KUBECONFIG=/dev/null tsh login --auth github --proxy teleport.production.skyscrape.rs
  fi
}

tsh-gen () {
  KUBECONFIG=/dev/null tsh login --auth github --proxy teleport.production.skyscrape.rs

  KUBEPATH="${KUBECONFIG:-$HOME/.kube/config}"

  cp ${KUBEPATH} ${KUBEPATH}.bak

  for cluster in $(tsh clusters | tail -n +3 | cut -f1 -d" "); do
    tsh login $cluster
    cluster=$cluster yq e -i '(.contexts.[] | select(.name == strenv(cluster)+"-*")) |= .name |= sub(strenv(cluster)+"-*", "")' ${KUBEPATH}
    # remove duplicate contexts
    yq e -i '.contexts |= unique_by(.name)' ${KUBEPATH}
    sed -i "s+Cellar/teleport/[0-9]\.[0-9]\.[0-9]/++g" ${KUBEPATH}
  done
}
