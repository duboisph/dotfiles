#!/usr/bin/env bash

BREW_PREFIX="$(brew --prefix)"

# Update already-installed formulae
brew update
brew upgrade

# Install latest Bash and set as default
brew install bash bash-completion@2

if ! grep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells
  chsh -s "${BREW_PREFIX}/bin/bash"
fi

# Install my must-haves
brew install \
  git \
  neovim \
  tmux

# Install utilities
brew install \
  ansible \
  awscli \
  docker \
  docker-compose \
  go \
  jq \
  kubectx \
  kubernetes-cli \
  kubernetes-helm \
  kustomize \
  mysql-client \
  python \
  python-yq \
  shellcheck \
  sonobuoy \
  teleport \
  terraform-docs \
  tfenv \
  thefuck \
  vault \
  velero

# Install these only on macOS (like newer version of core GNU utils)
if [[ "$(uname -s)" == "Darwin" ]]; then
  brew install \
    coreutils \
    findutils \
    gnu-sed \
    grep \
    gnupg \
    openssh \
    swig \
    wget \
    starkandwayne/cf/spruce
fi
