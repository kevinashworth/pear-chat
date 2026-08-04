#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Launch PearChat with an invite code on macOS.

Usage:
./launch-chat-with-invite.sh --invite INVITE [--app /path/to/PearChat.app] [--name NAME] [--storage DIR] [--reset]

Examples:
./launch-chat-with-invite.sh --invite abcdef...
./launch-chat-with-invite.sh --invite abcdef... --app ./out/PearChat-darwin-x64/PearChat.app
./launch-chat-with-invite.sh --invite abcdef... --app /Applications/PearChat.app --name user2 --storage /tmp/pear-chat-user2
EOF
}

INVITE=""
APP_ARG=""
NAME="user2"
STORAGE=""
RESET="false"

while [[ $# -gt 0 ]]; do
  case "$1" in
  --invite | -i)
    INVITE="${2:-}"
    shift 2
    ;;
  --app | -a)
    APP_ARG="${2:-}"
    shift 2
    ;;
  --name | -n)
    NAME="${2:-}"
    shift 2
    ;;
  --storage | -s)
    STORAGE="${2:-}"
    shift 2
    ;;
  --reset)
    RESET="true"
    shift
    ;;
  --help | -h)
    usage
    exit 0
    ;;
  *)
    echo "Unknown option: $1" >&2
    usage
    exit 1
    ;;
  esac
done

if [[ -z "$INVITE" ]]; then
  echo "Error: --invite is required." >&2
  usage
  exit 1
fi

if [[ -z "$STORAGE" ]]; then
  STORAGE="/tmp/pear-chat-${USER}-${NAME}"
fi

resolve_app() {
  local p

  if [[ -n "$APP_ARG" ]]; then
    if [[ -d "$APP_ARG" && "$APP_ARG" == *.app ]]; then
      echo "$APP_ARG"
      return 0
    fi
    if [[ -d "$APP_ARG" ]]; then
      for p in "$APP_ARG"/PearChat.app; do
        [[ -d "$p" ]] && {
          echo "$p"
          return 0
        }
      done
    fi
    echo "Error: --app path not found or not an .app bundle: $APP_ARG" >&2
    return 1
  fi

  local candidates=(
    "./out/PearChat-darwin-x64/PearChat.app"
    "./out/PearChat-darwin-arm64/PearChat.app"
    "./out/PearChat-darwin-universal/PearChat.app"
    "/Applications/PearChat.app"
  )

  for p in "${candidates[@]}"; do
    [[ -d "$p" ]] && {
      echo "$p"
      return 0
    }
  done

  shopt -s nullglob
  for p in ./out/*/PearChat.app; do
    [[ -d "$p" ]] && {
      echo "$p"
      shopt -u nullglob
      return 0
    }
  done
  shopt -u nullglob

  echo "Error: Could not find PearChat.app in ./out/* or /Applications." >&2
  return 1
}

to_abs_path() {
  local target="$1"
  if [[ "$target" = /* ]]; then
    echo "$target"
    return 0
  fi
  local dir base
  dir="$(cd "$(dirname "$target")" && pwd)"
  base="$(basename "$target")"
  echo "${dir}/${base}"
}

APP_PATH="$(resolve_app)"
APP_PATH="$(to_abs_path "$APP_PATH")"

ARGS=(--storage "$STORAGE" --name "$NAME" --invite "$INVITE")
if [[ "$RESET" == "true" ]]; then
  ARGS+=(--reset)
fi

echo "Launching: $APP_PATH"
echo "Args: ${ARGS[*]}"

open -n "$APP_PATH" --args "${ARGS[@]}"

echo "Launched."
echo "If this is a fresh join attempt, use a unique --storage or add --reset."
