#!/bin/bash

BACKUP_DIR="$DIR/.backups"

write_to_file() {
  FILE="$1"
  shift
  CONTENT="$*"

  [[ -z "$FILE" ]] && error "No file specified."
  mkdir -p "$(dirname "$FILE")"
  mkdir -p "$BACKUP_DIR"

  # Save backup
  if [[ -f "$FILE" ]]; then
    cp "$FILE" "$BACKUP_DIR/$(basename "$FILE").bak"
  fi

  echo "$CONTENT" >> "$FILE"
  log "Content written to $FILE"
}
