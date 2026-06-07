#!/usr/bin/env bash
set -euo pipefail
find . -type d -name "__pycache__" -prune -exec rm -rf {} + || true
find . -type d -name ".pytest_cache" -prune -exec rm -rf {} + || true
rm -rf build dist || true
find . -type f -name "*.pyc" -delete || true
echo "Clean complete."