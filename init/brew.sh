#!/usr/bin/env bash

# Update already-installed formulae
brew update
brew upgrade

# Add some taps
brew tap azure/kubelogin
brew tap aws/tap
brew tap fairwindsops/tap
brew tap fluxcd/tap
brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git
brew tap qmk/qmk
brew tap skyscrapers/tap
brew tap weaveworks/tap

# Set shell
MYSHELL=fish
brew install ${MYSHELL} starship tmux
if ! grep -q "${BREW_PREFIX}/bin/${MYSHELL}" /etc/shells; then
  echo "${BREW_PREFIX}/bin/${MYSHELL}" | sudo tee -a /etc/shells
  chsh -s "${BREW_PREFIX}/bin/${MYSHELL}"
fi

# Install utilities
brew install \
  aws-vault \
  aws/tap/ec2-instance-selector \
  aws/tap/eks-node-viewer \
  awscli \
  azure-cli \
  azure/kubelogin/kubelogin \
  exa \
  fairwindsops/tap/nova \
  fluxcd/tap/flux \
  git \
  git-crypt \
  go \
  golangci-lint \
  googlecontainertools/kpt/kpt \
  helm \
  istioctl \
  jq \
  k9s \
  krew \
  kubectx \
  kustomize \
  kubernetes-cli \
  logcli \
  neovim \
  shellcheck \
  sonobuoy \
  sops \
  teleport \
  terraform \
  terraform-docs \
  terragrunt \
  testssl \
  tfk8s \
  vault \
  velero \
  weaveworks/tap/tfctl \
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
    1password \
    1password-cli \
    appcleaner \
    choosy \
    docker \
    google-chrome \
    iterm2 \
    keybase \
    logi-options-plus \
    maccy \
    monitorcontrol \
    qmk-toolbox \
    rapsberry-pi-images \
    tunnelblick \
    visual-studio-code \
    vlc \
    zoom
fi
