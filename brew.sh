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

# Install Neovim
brew install neovim/neovim/neovim

# Install more recent versions of some macOS tools
brew install rsync

# Install useful binaries
brew install ansible
brew install ansible-lint
brew install awscli
brew install git
brew install gnupg
brew install go
brew install imagemagick --with-webp
brew install jsonlint
brew install kops
brew install kubernetes-cli
brew install kubernetes-helm
brew install minicom
brew install mmv
brew install mysql
brew install node
brew install packer
brew install packer-completion
brew install percona-toolkit
brew install postgresql
brew install pv
brew install python
brew install python3
brew install rbenv
brew install rbenv-gemset
brew install reattach-to-user-namespace
brew install s3cmd
brew install shellcheck
brew install terraform
brew install wata727/tflint/tflint
brew install testssl
brew install tmux
brew install watch
brew install wget --with-iri
brew install xz

# Install Casks
brew cask install fly
brew cask install ksdiff
brew cask install puppet-agent
brew cask install vagrant
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install wercker-cli

# Install fonts
brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-fira-mono
brew cask install font-fira-sans
brew cask install font-open-sans

# Remove outdated versions from the Cellar
brew cleanup
brew cask cleanup
