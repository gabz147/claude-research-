#!/usr/bin/env bash
# Objective evaluator gates for one autonomous cycle.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$DIR/.." && pwd)"
exec python3 "$DIR/aro.py" --root "$ROOT" verify-cycle "$@"
