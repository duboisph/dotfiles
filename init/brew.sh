#!/usr/bin/env bash

BREW_PREFIX="$(brew --prefix)"

# Update already-installed formulae
brew update
brew upgrade

# Install utilities
brew install \
  ansible \
  awscli \
  docker-compose \
  git-crypt \
  helm \
  jq \
  krew \
  kubectx \
  kubernetes-cli \
  kustomize \
  mysql-client \
  python \
  python-yq \
  ruby \
  shellcheck \
  sonobuoy \
  sops \
  teleport \
  terraform \
  terraform-docs \
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

  # if ! grep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  #   echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells
  #   chsh -s "${BREW_PREFIX}/bin/bash"
  # fi
fi
