#!/usr/bin/env bash

# Update already-installed formulae
brew update
brew upgrade

# Add some taps
brew tap weaveworks/tap
brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git

# Install utilities
brew install \
  aws-vault \
  helm \
  istioctl \
  k9s \
  kpt \
  krew \
  kubeaudit \
  kubectx \
  kubernetes-cli \
  kustomize \
  sonobuoy \
  sops \
  teleport \
  terraform-docs \
  tfenv \
  velero
