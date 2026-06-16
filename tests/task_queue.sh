#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/queue/pending" "$TMP/queue/active" "$TMP/queue/completed" "$TMP/queue/failed" "$TMP/logs"
python3 "$ROOT/scripts/aro.py" --root "$TMP" task new HIGH queue smoke test >/tmp/aro-task-id
id="$(cat /tmp/aro-task-id)"
test -f "$TMP/queue/pending/$id.json"
python3 "$ROOT/scripts/aro.py" --root "$TMP" task move "$id" active
test -f "$TMP/queue/active/$id.json"
python3 "$ROOT/scripts/aro.py" --root "$TMP" task move "$id" failed
test -f "$TMP/queue/failed/$id.json"
echo "task queue smoke test passed"
