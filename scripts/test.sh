#!/usr/bin/env bash
# Run tests using venv python if present
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

if ! "$PY" -m pip show pytest >/dev/null 2>&1; then
  echo "pytest not installed. Install with: $PY -m pip install pytest" >&2
  exit 1
fi

"$PY" -m pytest -q