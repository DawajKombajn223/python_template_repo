#!/usr/bin/env bash
set -euo pipefail
PY=python
if [ -x .venv/bin/python ]; then
  PY=.venv/bin/python
elif command -v python3 >/dev/null 2>&1; then
  PY=python3
elif command -v py >/dev/null 2>&1; then
  PY=py
fi

if ! command -v "$PY" >/dev/null 2>&1; then
  echo "Python not found. Run ./scripts/init.sh or install Python and try again." >&2
  exit 1
fi

if ! "$PY" -m pip show black >/dev/null 2>&1; then
  echo "black not installed. Install with: $PY -m pip install black" >&2
  exit 1
fi

"$PY" -m black .