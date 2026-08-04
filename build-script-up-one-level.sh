#!/usr/bin/env bash
set -euo pipefail

# See https://docs.pears.com/getting-started/build-a-peer-to-peer-chat/ship/#build-the-deployment-directory
# Run it from one level up like: `./pear-chat/build-script-up-one-level.sh`

if [[ ! -f "./pear-chat/package.json" ]]; then
  echo "Error: run this script from the parent directory that contains pear-chat/." >&2
  echo "Expected to find ./pear-chat/package.json from current directory: $PWD" >&2
  exit 1
fi

if [[ ! -d "./pear-chat/out/PearChat-darwin-arm64/PearChat.app" ]]; then
  echo "Error: missing ./pear-chat/out/PearChat-darwin-arm64/PearChat.app" >&2
  exit 1
fi

if [[ ! -d "./pear-chat/out/PearChat-darwin-x64/PearChat.app" ]]; then
  echo "Error: missing ./pear-chat/out/PearChat-darwin-x64/PearChat.app" >&2
  exit 1
fi

pear build \
  --package=./pear-chat/package.json \
  --darwin-arm64-app ./pear-chat/out/PearChat-darwin-arm64/PearChat.app \
  --darwin-x64-app ./pear-chat/out/PearChat-darwin-x64/PearChat.app \
  --target pear-chat-1.0.1
