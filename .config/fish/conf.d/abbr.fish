# ls
abbr ll 'exa -lgh'
abbr la 'exa -lgha'

# Defaults
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

if type nvim >/dev/null 2>&1
    abbr vim nvim
    abbr vi nvim
end

# Reload the shell (i.e. invoke as a login shell)
abbr reload 'source ~/.config/fish/config.fish'

# Shortcuts
abbr kc kubectl
abbr avl 'aws-vault login'
abbr fly-clean 'fly prune-worker --all-stalled'
abbr tfdocs 'terraform-docs markdown --sort-by required --escape=false'

# IP address
abbr myip 'dig +short myip.opendns.com @resolver1.opendns.com'

# OS specific
if test (uname -s) = Darwin
    # Update the system
    abbr update 'sudo softwareupdate -i -a; brew update && brew upgrade'

    # Show/hide hidden files in Finder
    abbr show 'defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
    abbr hide 'defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
else if test (uname -s) = Linux
    # Update the system
    abbr update 'sudo apt update && sudo apt full-upgrade && sudo apt autopurge -y; brew update && brew upgrade'
end

## Expand .. to cd ../, ... to cd ../../ and .... to cd ../../../ and so on.
# https://github.com/fish-shell/fish-shell/releases/tag/3.6.0

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

## Expand !! to the last history item
# https://github.com/fish-shell/fish-shell/releases/tag/3.6.0

function last_history_item
    echo $history[1]
end

abbr --add !! --position anywhere --function last_history_item
