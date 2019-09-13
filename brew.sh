#!/usr/bin/env bash

BREW_PREFIX="$(brew --prefix)"

# Update already-installed formulae
brew update
brew upgrade

# Install latest Bash and set as default
# brew install bash bash-completion@2

if ! grep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells
  chsh -s "${BREW_PREFIX}/bin/bash"
fi

# Install my must-haves
brew install \
  git \
  neovim \
  openssh \
  tmux

# Install newer version of core GNU utilities on macOS
if [[ "$(uname -s)" == "Darwin" ]]; then
  brew install \
    coreutils \
    findutils \
    gnu-sed \
    grep \
    gnupg \
    wget
fi

# Install utilities
brew install \
  ansible \
  awscli \
  calicoctl \
  cfssl \
  docker \
  docker-compose \
  go \
  jq \
  kops \
  kubectx \
  kubernetes-cli \
  kubernetes-helm \
  kustomize \
  mysql-client \
  python \
  python-yq \
  ruby \
  shellcheck \
  sonobuoy \
  teleport \
  terraform-docs \
  tfenv \
  thefuck \
  vault \
  velero
