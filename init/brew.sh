#!/usr/bin/env bash

# Update already-installed formulae
brew update
brew upgrade

# Add kpt tap
brew tap GoogleContainerTools/kpt https://github.com/GoogleContainerTools/kpt.git

# Install utilities
brew install \
  ansible \
  awscli \
  azure-cli \
  docker-compose \
  eksctl \
  git-crypt \
  helm \
  jq \
  k9s \
  kpt \
  krew \
  kubeaudit \
  kubectx \
  kubernetes-cli \
  kustomize \
  mysql-client \
  python-yq \
  shellcheck \
  sonobuoy \
  sops \
  teleport \
  terraform-docs \
  tfenv \
  velero
#  vault

# Install these only on macOS (like newer version of core GNU utils)
if [[ "$(uname -s)" == "Darwin" ]]; then
  brew install \
    bash
    bash-completion@2
    coreutils \
    findutils \
    git \
    gnu-sed \
    grep \
    gnupg \
    neovim \
    openssh \
    swig \
    tmux \
    wget

  # BREW_PREFIX="$(brew --prefix)"
  # if ! grep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  #   echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells
  #   chsh -s "${BREW_PREFIX}/bin/bash"
  # fi
fi
