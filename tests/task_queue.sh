#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/queue/pending" "$TMP/queue/active" "$TMP/queue/completed" "$TMP/queue/failed" "$TMP/logs"

id="$(python3 "$ROOT/scripts/aro.py" --root "$TMP" task new HIGH "queue smoke test")"
printf '%s' "$id" | grep -Eq '^TASK-[0-9]{4}$'
test -f "$TMP/queue/pending/$id.json"

python3 "$ROOT/scripts/aro.py" --root "$TMP" task move "$id" active
test -f "$TMP/queue/active/$id.json"
test ! -f "$TMP/queue/pending/$id.json"
test "$(python3 - "$TMP/queue/active/$id.json" <<'PY'
import json
import sys
print(json.load(open(sys.argv[1]))["status"])
PY
)" = "ACTIVE"

python3 "$ROOT/scripts/aro.py" --root "$TMP" task move "$id" failed
test -f "$TMP/queue/failed/$id.json"
test ! -f "$TMP/queue/active/$id.json"
test "$(python3 - "$TMP/queue/failed/$id.json" <<'PY'
import json
import sys
print(json.load(open(sys.argv[1]))["status"])
PY
)" = "FAILED"

if python3 "$ROOT/scripts/aro.py" --root "$TMP" task move "$id" missing >/dev/null 2>&1; then
  echo "expected invalid queue state to fail" >&2
  exit 1
fi

echo "task queue smoke test passed"
