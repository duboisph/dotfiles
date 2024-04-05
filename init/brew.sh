#!/usr/bin/env bash

# Update already-installed formulae
brew update
brew upgrade

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
  aws/tap/eks-node-viewer \
  awscli \
  exa \
  fairwindsops/tap/nova \
  fluxcd/tap/flux \
  gh \
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
  neovim \
  opentofu \
  shellcheck \
  sonobuoy \
  sops \
  teleport \
  terraform-docs \
  terragrunt \
  testssl \
  tfk8s \
  tflint \
  vault \
  velero \
  weaveworks/tap/eksctl \
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

  # Install casked apps
  brew install --cask \
    1password \
    1password-cli \
    appcleaner \
    choosy \
    docker \
    google-chrome \
    homebrew/cask-fonts/font-cascadia-code-pl \
    iterm2 \
    keybase \
    logi-options-plus \
    maccy \
    monitorcontrol \
    tunnelblick \
    visual-studio-code \
    vlc \
    zoom
fi
