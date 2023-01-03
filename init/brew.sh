#!/usr/bin/env bash

MYSHELL=fish

# Update already-installed formulae
brew update
brew upgrade

# Add some taps
brew tap azure/kubelogin
brew tap fluxcd/tap
brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git
brew tap qmk/qmk
brew tap skyscrapers/tap

# Set shell
brew install ${MYSHELL} starship
if ! grep -q "${BREW_PREFIX}/bin/${MYSHELL}" /etc/shells; then
  echo "${BREW_PREFIX}/bin/${MYSHELL}" | sudo tee -a /etc/shells
  chsh -s "${BREW_PREFIX}/bin/${MYSHELL}"
fi

# Install utilities
brew install \
  aws-vault \
  awscli \
  azure-cli \
  azure/kubelogin/kubelogin \
  exa \
  fluxctl \
  git \
  git-crypt \
  gnupg \
  go \
  googlecontainertools/kpt/kpt \
  helm \
  istioctl \
  k9s \
  krew \
  kubectx \
  kubernetes-cli \
  logcli \
  neovim \
  qmk/qmk/qmk \
  shellcheck \
  skyscrapers/tap/tf \
  sonobuoy \
  sops \
  teleport \
  terraform \
  terraform-docs \
  terragrunt \
  tmux \
  vault \
  velero \
  ykman \
  yq

# macOS specific
if [[ "$(uname -s)" == "Darwin" ]]; then
  # Install GNU utils + newer versions of built-ins
  brew install \
    coreutils \
    findutils \
    gnu-sed \
    grep \
    watch

  # Install fonts
  brew install --cask \
    homebrew/cask-fonts/font-cascadia-code \
    homebrew/cask-fonts/font-cascadia-code-pl \
    homebrew/cask-fonts/font-cascadia-mono \
    homebrew/cask-fonts/font-cascadia-mono-pl \
    homebrew/cask-fonts/font-caskaydia-cove-nerd-font

  # Install casked apps
  #brew install --cask foo
fi
