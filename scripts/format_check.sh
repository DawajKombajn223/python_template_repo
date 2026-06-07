#!/usr/bin/env bash
set -euo pipefail
PY=.venv/bin/python
if [ ! -x "$PY" ]; then
  if command -v python3 >/dev/null 2>&1; then
    PY=python3
  elif command -v py >/dev/null 2>&1; then
    PY=py
  else
    echo "Python not found. Ensure venv created or python available." >&2
    exit 1
  fi
fi

if ! "$PY" -m pip show black >/dev/null 2>&1; then
  echo "black not installed. Installing..."
  "$PY" -m pip install black
fi

"$PY" -m black --check .
