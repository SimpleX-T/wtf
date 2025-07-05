#!/bin/bash

BACKUP_DIR="$DIR/.backups"

write_to_file() {
  OVERWRITE=${WTF_DEFAULT_OVERWRITE:-false}
  CONFIRM=${WTF_CONFIRM_OVERWRITE:-true}

  while [[ "$1" == -* ]]; do
    case "$1" in
      -o|--overwrite)
        OVERWRITE=true
        shift
        ;;
      *)
        break
        ;;
    esac
  done

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

  # Confirm before overwrite
  if $OVERWRITE && [[ -f "$FILE" ]] && [[ "$CONFIRM" != "false" ]]; then
    read -p "⚠️  $FILE exists. Overwrite? (Y/n): " confirm
    confirm=${confirm:-y}
    if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
      echo "❌ Aborted."
      exit 1
    fi
  fi

  if $OVERWRITE; then
    echo "$CONTENT" > "$FILE"
  else
    echo "$CONTENT" >> "$FILE"
  fi

  log "Content written to $FILE"
}