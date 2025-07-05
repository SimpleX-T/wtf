#!/bin/bash

use_template() {
  FILE="$1"
  TEMPLATE="$2"

  TEMPLATE_PATH="$DIR/templates/$TEMPLATE.txt"

  [[ ! -f "$TEMPLATE_PATH" ]] && error "Template $TEMPLATE not found."
  cat "$TEMPLATE_PATH" >> "$FILE"
  log "Inserted template $TEMPLATE into $FILE"
}