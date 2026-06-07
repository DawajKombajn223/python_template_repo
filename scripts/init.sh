#!/usr/bin/env bash
# Initializes a venv in .venv and installs dependencies
set -euo pipefail
if [ ! -d .venv ]; then
  python -m venv .venv
  .venv/bin/python -m pip install --upgrade pip
fi
PY=.venv/bin/python
$PY -m pip install -r requirements.txt
$PY -m pip install -r requirements-dev.txt
echo "Initialized. To activate: source .venv/bin/activate"