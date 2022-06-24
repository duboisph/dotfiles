# ls
abbr ll 'exa -lgh --icons'
abbr la 'exa -lgha --icons'

# defaults
abbr grep 'grep --color=auto'
abbr fgrep 'fgrep --color=auto'
abbr egrep 'egrep --color=auto'
abbr mv 'mv -iv'
abbr rm 'rm -iv'
abbr cp 'cp -iav'
abbr df 'df -h'
abbr free 'free -m'
abbr fuser 'fuser -v'
abbr ping 'ping -c 5'

if type nvim > /dev/null 2>&1
  abbr vim 'nvim'
  abbr vi 'nvim'
end

# IP address
abbr myip 'dig +short myip.opendns.com @resolver1.opendns.com'

# Update the system
abbr update 'sudo apt update && sudo apt full-upgrade && sudo apt autopurge -y; brew upgrade'

# Reload the shell (i.e. invoke as a login shell)
abbr reload 'source ~/.config/fish/config.fish'

# Shortcuts
abbr kc 'kubectl'
abbr kube-dashboard 'kubectl auth-proxy -n kubernetes-dashboard https://kubernetes-dashboard.svc'
abbr awslogin 'aws-vault login'
