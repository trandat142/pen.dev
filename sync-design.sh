#!/bin/bash

REPO="/Users/trandat/orca/pen.dev"
WATCH_DIR="$REPO/assets/design"

echo "Đang theo dõi: $WATCH_DIR"

fswatch -o "$WATCH_DIR" | while read; do
  sleep 2

  cd "$REPO" || exit 1

  git add assets/design

  if ! git diff --cached --quiet; then
    git commit -m "chore: sync Pen export"
    git push origin main
    echo "Đã đồng bộ lên GitHub."
  fi
done
