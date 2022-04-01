#!/usr/bin/env bash

# Update already-installed formulae
brew update
brew upgrade

# Add some taps
brew tap fluxcd/tap
brew tap skyscrapers/tap

# Install utilities
brew install \
  aws-vault \
  fluxctl \
  helm \
  istioctl \
  k9s \
  krew \
  kubectx \
  kubernetes-cli \
  sonobuoy \
  sops \
  starship \
  teleport \
  terraform \
  terraform-docs \
  tf \
  vault \
  velero \
  yq
