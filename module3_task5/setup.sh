#!/bin/bash
sudo apt-get update && sudo apt-get install -y make curl
# Download Hugo binary
HUGO_VERSION="0.84.0"
HUGO_BINARY="hugo_extended_${HUGO_VERSION}_Linux-64bit.deb"
curl -LO "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}"
sudo dpkg -i ${HUGO_BINARY}
rm ${HUGO_BINARY}
GOLANGCILINT_VERSION="1.52.2"
curl --silent --show-error --location --output /tmp/golangci-lint.deb \
     "https://github.com/golangci/golangci-lint/releases/download/v${GOLANGCILINT_VERSION}/golangci-lint-${GOLANGCILINT_VERSION}-linux-amd64.deb"
sudo dpkg -i /tmp/golangci-lint.deb
rm -f /tmp/golangci-lint.deb
sudo npm install --global \
  markdownlint-cli@0.26.0 \
  markdown-link-check@3.8.6
