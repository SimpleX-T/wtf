#!/bin/bash

undo() {
  FILE="$1"
  BACKUP_FILE="$DIR/.backups/$(basename "$FILE").bak"

  if [[ -f "$BACKUP_FILE" ]]; then
    cp "$BACKUP_FILE" "$FILE"
    log "Undo successful. Restored $FILE from backup."
  else
    error "No backup found for $FILE."
  fi
}