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
  aws/tap/eks-node-viewer \
  awscli \
  eza \
  fluxcd/tap/flux \
  gh \
  git \
  helm \
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
  terragrunt \
  tflint \
  velero \
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
    bettermouse \
    font-cascadia-code \
    font-cascadia-code-pl \
    iterm2 \
    keybase \
    maccy \
    tailscale \
    visual-studio-code \
    vlc \
    zoom
fi
