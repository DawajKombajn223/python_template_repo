#!/usr/bin/env bash
# Simple task runner for Unix-like shells. Usage:
#   ./scripts/run.sh check-format
# Available tasks: init, test, format, check-format, lint, clean
set -euo pipefail
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <task>" >&2
  exit 2
fi
TASK=$1
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
TARGET="$SCRIPT_DIR/$TASK.sh"
if [ ! -f "$TARGET" ]; then
  echo "Task script not found: $TARGET" >&2
  exit 1
fi
echo "Running $TASK -> $TARGET"
exec bash "$TARGET"
