#!/usr/bin/env bash

# Detect OS
os=$(uname)
echo "OS detected: ${os}"
case $os in
  Darwin)
  if [[ $(command -v brew) != "" ]]; then
    echo "Installing kubectl with brew..."
    brew install kubectl
  else
    echo "Installing kubectl binary..."
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/arm64/kubectl"
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
    kubectl version --client
  fi
  ;;
  Linux)
  # install binary
  ;;
  *)
  echo "Current OS (${os}) is not supported"
  exit 1
esac
