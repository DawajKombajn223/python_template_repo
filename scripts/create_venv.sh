#!/usr/bin/env bash
set -euo pipefail
# Create .venv and install dependencies
if [ ! -d .venv ]; then
  python -m venv .venv
  .venv/bin/python -m pip install --upgrade pip
fi
PY=.venv/bin/python
$PY -m pip install -r requirements.txt || true
$PY -m pip install -r requirements-dev.txt || true
echo "Created .venv and installed dependencies (if requirements files existed)."