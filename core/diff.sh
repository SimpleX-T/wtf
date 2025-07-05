#!/bin/bash

show_diff() {
  FILE="$1"
  shift
  NEW_CONTENT="$*"

  TMP_FILE=$(mktemp)
  echo "$NEW_CONTENT" > "$TMP_FILE"

  if [[ -f "$FILE" ]]; then
    echo "🔍 Showing diff for $FILE"
    diff -u "$FILE" "$TMP_FILE"
  else
    echo "📄 $FILE does not exist. Showing new content:"
    cat "$TMP_FILE"
  fi

  rm "$TMP_FILE"
}