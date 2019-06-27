#!/usr/bin/env bash

#readonly TMUX_SYMBOL_K8S="\u2388"
readonly TMUX_SYMBOL_K8S="\u2638"

kube_context() {
  local context
  local namespace

  if [[ -f "${HOME}/.kube/config" ]]; then
    context="$(kubectl config current-context 2> /dev/null)"
    namespace="$(kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${context}\")].context.namespace}")"
    namespace=${namespace:-default}
    echo -e "${TMUX_SYMBOL_K8S} ${context}:${namespace}"
  fi
}

kube_context
