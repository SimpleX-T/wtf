#!/bin/bash

log() {
  echo "🔹 $1"
}

error() {
  echo "❌ $1" >&2
  exit 1
}

load_config() {
  CONFIG_FILE="$HOME/.wtfrc"
  [[ -f "$CONFIG_FILE" ]] || return

  while IFS='=' read -r key value; do
    key=$(echo "$key" | tr -d '[:space:]')
    value=$(echo "$value" | tr -d '[:space:]')
    case "$key" in
      default_overwrite) export WTF_DEFAULT_OVERWRITE="$value" ;;
      confirm_before_overwrite) export WTF_CONFIRM_OVERWRITE="$value" ;;
      default_template) export WTF_DEFAULT_TEMPLATE="$value" ;;
      editor) export WTF_EDITOR="$value" ;;
    esac
  done < <(grep -v '^#' "$CONFIG_FILE" | grep '=')
}

show_help() {
  cat <<EOF
wtf - Write To File utility (v1.1.0)

Usage:
  wtf <filename> [-o|--overwrite] ["content"]
  wtf --template <file> <template-name>
  wtf --undo <filename>
  wtf --diff <filename> "new content"

Options:
  -o, --overwrite    Overwrite file instead of appending
  --help, -h         Show help
  --version, -v      Show version
  --undo             Undo last write
  --template         Insert a named template
  --diff             Show file diff before writing
EOF
}