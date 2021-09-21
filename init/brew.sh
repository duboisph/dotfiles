#!/usr/bin/env bash

# Update already-installed formulae
brew update
brew upgrade

# Add some taps
brew tap aquasecurity/trivy
brew tap fluxcd/tap
brew tap weaveworks/tap

# Install utilities
brew install \
  aws-vault \
  fluxctl \
  helm \
  istioctl \
  k9s \
  krew \
  kubeaudit \
  kubectx \
  kubernetes-cli \
  kustomize \
  sonobuoy \
  sops \
  starship \
  teleport \
  terraform-docs \
  tfenv \
  trivy \
  velero
