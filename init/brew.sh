#!/usr/bin/env bash

MYSHELL=fish

# Update already-installed formulae
brew update
brew upgrade

# Add some taps
brew tap azure/kubelogin
brew tap aws/tap
brew tap fairwindsops/tap
brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git
brew tap qmk/qmk
brew tap skyscrapers/tap

# Set shell
brew install ${MYSHELL} starship tmux
if ! grep -q "${BREW_PREFIX}/bin/${MYSHELL}" /etc/shells; then
  echo "${BREW_PREFIX}/bin/${MYSHELL}" | sudo tee -a /etc/shells
  chsh -s "${BREW_PREFIX}/bin/${MYSHELL}"
fi

# Install utilities
brew install \
  aws-vault \
  aws/tap/eks-node-viewer \
  awscli \
  azure-cli \
  azure/kubelogin/kubelogin \
  exa \
  fairwindsops/tap/nova \
  git \
  git-crypt \
  googlecontainertools/kpt/kpt \
  helm \
  istioctl \
  jq \
  k9s \
  krew \
  kubectx \
  kubernetes-cli \
  logcli \
  neovim \
  qmk/qmk/qmk \
  shellcheck \
  sonobuoy \
  sops \
  teleport \
  terraform \
  terraform-docs \
  terragrunt \
  testssl \
  vault \
  velero \
  ykman \
  yq

# macOS specific
if [[ "$(uname -s)" == "Darwin" ]]; then
  brew install \
    coreutils \
    findutils \
    gnu-sed \
    gnupg \
    grep \
    imagemagick \
    telnet \
    watch \
    wget

  # Install fonts
  brew install --cask \
    homebrew/cask-fonts/font-cascadia-code \
    homebrew/cask-fonts/font-cascadia-code-pl \
    homebrew/cask-fonts/font-cascadia-mono \
    homebrew/cask-fonts/font-cascadia-mono-pl \
    homebrew/cask-fonts/font-caskaydia-cove-nerd-font

  # Install casked apps
  brew install --cask \
    appcleaner \
    google-chrome \
    tunnelblick \
    vlc
fi
