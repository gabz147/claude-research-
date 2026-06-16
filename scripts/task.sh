#!/usr/bin/env bash
# task.sh — task queue management.
# Usage:
#   task.sh new <PRIORITY> <description...>     create pending task, prints ID
#   task.sh list [state]                        list tasks (default: all)
#   task.sh move <ID> <state>                   move task: pending|active|completed|failed
#   task.sh show <ID>                           print task json
# Tasks are JSON files: queue/<state>/<ID>.json
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
Q="$ROOT/queue"

valid_queue_state() {
  case "$1" in pending|active|completed|failed) return 0 ;; *) return 1 ;; esac
}

ensure_queue_dirs() {
  mkdir -p "$Q/pending" "$Q/active" "$Q/completed" "$Q/failed"
}

find_task() { find "$Q" -name "$1.json" 2>/dev/null | head -n 1; }

next_id() {
  local n
  n=$(find "$Q" -name 'TASK-*.json' 2>/dev/null | sed -E 's/.*TASK-0*([0-9]+)\.json/\1/' | sort -n | tail -1)
  printf 'TASK-%04d' "$(( ${n:-0} + 1 ))"
}

case "${1:-list}" in
  new)
    ensure_queue_dirs
    pri="${2:-MED}"; shift 2 || true; desc="$*"
    [ -n "$desc" ] || { log ERROR "task.sh: description required"; exit 1; }
    id="$(next_id)"; now="$(iso_now)"
    jq -nc --arg id "$id" --arg pri "$pri" --arg d "$desc" --arg t "$now" \
      '{id:$id,priority:$pri,status:"PENDING",description:$d,dependencies:[],created:$t,updated:$t,owner:"Researcher",confidence:"MED",effort:"M",notes:""}' \
      > "$Q/pending/$id.json"
    log INFO "task.sh: created $id ($pri) $desc"
    echo "$id" ;;
  list)
    ensure_queue_dirs
    state="${2:-}"
    [ -z "$state" ] || valid_queue_state "$state" || { log ERROR "bad state $state"; exit 1; }
    for s in pending active completed failed; do
      [ -n "$state" ] && [ "$state" != "$s" ] && continue
      for f in "$Q/$s"/*.json; do
        [ -e "$f" ] || continue
        jq -r '"[\(.priority)] \(.id) \(.status) — \(.description)"' "$f"
      done
    done ;;
  move)
    ensure_queue_dirs
    id="${2:-}"; dest="${3:-}"
    [ -n "$id" ] && [ -n "$dest" ] || { echo "usage: task.sh move <ID> <state>" >&2; exit 1; }
    f="$(find_task "$id")"
    [ -z "$f" ] && { log ERROR "task.sh: $id not found"; exit 1; }
    valid_queue_state "$dest" || { log ERROR "bad state $dest"; exit 1; }
    DSTATE=$(echo "$dest" | tr '[:lower:]' '[:upper:]')
    tmp="$(mktemp)"
    jq --arg s "$DSTATE" --arg t "$(iso_now)" '.status=$s | .updated=$t' "$f" > "$tmp"
    mv "$tmp" "$Q/$dest/$id.json"
    [ "$f" != "$Q/$dest/$id.json" ] && rm -f "$f"
    log INFO "task.sh: moved $id -> $dest" ;;
  show)
    ensure_queue_dirs
    id="${2:-}"; [ -n "$id" ] || { echo "usage: task.sh show <ID>" >&2; exit 1; }
    f="$(find_task "$id")"; [ -z "$f" ] && { echo "not found"; exit 1; }; cat "$f" ;;
  *) echo "usage: task.sh {new|list|move|show} ..."; exit 1 ;;
esac
