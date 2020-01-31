#!/usr/bin/env bash

kube_context() {
  local context
  local namespace

  if [[ -f "${HOME}/.kube/config" ]]; then
    context="$(kubectl config current-context 2> /dev/null)"
    namespace="$(kubectl config view -o=jsonpath="{.contexts[?(@.name==\"${context}\")].context.namespace}")"
    namespace=${namespace:-default}
    echo -e "${context}:${namespace}"
  fi
}

kube_context
