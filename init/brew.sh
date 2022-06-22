#!/usr/bin/env bash

# Update already-installed formulae
brew update
brew upgrade

# Add some taps
brew tap azure/kubelogin
brew tap fluxcd/tap
brew tap googlecontainertools/kpt
brew tap skyscrapers/tap

# Install utilities
brew install \
  aws-vault \
  exa \
  fluxctl \
  helm \
  istioctl \
  k9s \
  kpt \
  krew \
  kubectx \
  kubelogin \
  kubernetes-cli \
  logcli \
  neovim \
  sonobuoy \
  sops \
  starship \
  teleport \
  terraform \
  terraform-docs \
  terragrunt \
  tf \
  tmux \
  vault \
  velero \
  yq
