#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMPDIR="$(mktemp -d)"
trap 'rm -rf "$TMPDIR"' EXIT

cp -a "$ROOT/." "$TMPDIR/repo"
cd "$TMPDIR/repo"

id="$(scripts/task.sh new HIGH "queue smoke test")"
printf '%s' "$id" | grep -Eq '^TASK-[0-9]{4}$'
test -f "queue/pending/$id.json"

scripts/task.sh move "$id" active
test -f "queue/active/$id.json"
test ! -f "queue/pending/$id.json"
test "$(jq -r '.status' "queue/active/$id.json")" = "ACTIVE"

scripts/task.sh move "$id" failed
test -f "queue/failed/$id.json"
test ! -f "queue/active/$id.json"
test "$(jq -r '.status' "queue/failed/$id.json")" = "FAILED"

if scripts/task.sh move "$id" missing >/dev/null 2>&1; then
  echo "expected invalid queue state to fail" >&2
  exit 1
fi

echo "task queue smoke test passed"
