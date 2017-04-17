#!/usr/bin/env bash

# Install command-line tools using Homebrew

# Make sure we’re using the latest Homebrew and upgrade all formulae
brew update
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`
# and `$(brew --prefix coreutils)/libexec/gnuman` to `$MANPATH`
brew install coreutils
brew install diffutils
#brew install findutils --with-default-names
#brew install gawk
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
#brew install gnu-which --with-default-names

# Install Bash 4 and set it as default shell
brew install bash
brew install bash-completion@2

if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install Neovim and link it's settings to Vim's
brew install neovim/neovim/neovim

if [[ ! -d "$HOME/.config/nvim" || ! -h "$HOME/.config/nvim" ]]; then
  mkdir -p "$HOME/.config/"
  ln -s "$HOME/.vim" "$HOME/.config/nvim"
  ln -s "$HOME/.vimrc" "$HOME/.config/nvim/init.vim"
fi

# Install more recent versions of some macOS tools
brew install rsync
brew install screen

# Install useful binaries
brew install ansible
brew install awscli
brew install git
brew install git-lfs
brew install gnupg
brew install go
brew install imagemagick --with-webp
brew install kubernetes-cli
brew install minicom
brew install mmv
brew install mysql
brew install nmap
brew install packer
brew install packer-completion
brew install percona-toolkit
brew install pv
brew install python
brew install python3
brew install rbenv
brew install rbenv-gemset
brew install s3cmd
brew install shellcheck
brew install socat
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install terraform
brew install testssl
brew install tmux
brew install wget --with-iri
brew install xz

# Install Casks
brew cask install ksdiff
brew cask install puppet-agent
brew cask install vagrant
brew cask install wercker-cli

# Remove outdated versions from the Cellar
brew cleanup
brew cask cleanup
