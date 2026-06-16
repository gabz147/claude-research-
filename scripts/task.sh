#!/usr/bin/env bash
# Compatibility wrapper for Python task queue operations.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$DIR/.." && pwd)"
exec python3 "$DIR/aro.py" --root "$ROOT" task "$@"
