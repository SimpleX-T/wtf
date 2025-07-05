#!/bin/bash

log() {
  echo "🔹 $1"
}

error() {
  echo "❌ $1" >&2
  exit 1
}

show_help() {
  cat <<EOF
wtf - Write To File utility (v1.1.0)

Usage:
  wtf <filename> ["content"]
  wtf --template <file> <template-name>
  wtf --undo <filename>
  wtf --diff <filename> "new content"

Options:
  --help, -h        Show help
  --version, -v     Show version
  --undo            Undo last write
  --template        Insert a named template
  --diff            Show file diff before writing
EOF
}