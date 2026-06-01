#!/usr/bin/env bash
# registry.sh — authoritative opportunity registry + dedup checkpoint.
# The registry (research/opportunity_registry.json) is the org's master record of
# EVERY opportunity ever investigated. This script is the ONLY supported write path
# so IDs stay unique, state stays consistent, and research never duplicates.
#
# Usage:
#   registry.sh search <terms...>        DEDUP CHECKPOINT — run BEFORE any new research.
#   registry.sh next-id                  print the next OPP-YYYY-NNN id (does not reserve)
#   registry.sh add --name N --industry I --problem P --score S \
#                   [--status STATUS] [--confidence C] [--reasoning "..."] \
#                   [--related "OPP-..,OPP-.."]    mint id, create record + research file, reindex
#   registry.sh update <ID> [--status S] [--score N] [--confidence C] [--reasoning "..."] \
#                   [--add-file PATH] [--add-related OPP-..]    patch a record, move file if state changed
#   registry.sh show <ID>                pretty-print one record
#   registry.sh list [STATUS]            table of records (optionally one status)
#   registry.sh reindex                  regenerate research/INDEX.md from the registry
#
# Statuses: DISCOVERED MONITORING VALIDATING VALIDATED EXECUTION_CANDIDATE BUILDING DEPLOYED ARCHIVED REJECTED
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"

REG="$ROOT/research/opportunity_registry.json"
INDEX="$ROOT/research/INDEX.md"
[ -f "$REG" ] || { mkdir -p "$ROOT/research"; jq -n --arg n "$(iso_now)" '{schema_version:1,updated:$n,id_format:"OPP-YYYY-NNN",opportunities:[]}' > "$REG"; }

VALID_STATUS="DISCOVERED MONITORING VALIDATING VALIDATED EXECUTION_CANDIDATE BUILDING DEPLOYED ARCHIVED REJECTED"

status_dir() {  # map a status to its research/ subdir
  case "$1" in
    DISCOVERED|MONITORING|VALIDATING) echo active ;;
    VALIDATED)                        echo validated ;;
    EXECUTION_CANDIDATE|BUILDING|DEPLOYED) echo execution ;;
    ARCHIVED)                         echo archived ;;
    REJECTED)                         echo rejected ;;
    *)                                echo active ;;
  esac
}
valid_status() { case " $VALID_STATUS " in *" $1 "*) return 0;; *) return 1;; esac; }
slugify() { echo "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g' | cut -c1-50; }
reg_write() { local tmp; tmp="$(mktemp)"; if jq "$@" "$REG" >"$tmp" 2>/dev/null; then mv "$tmp" "$REG"; else rm -f "$tmp"; log ERROR "registry write failed: $*"; return 1; fi; }

next_id() {
  local year max n
  year="$(date -u +%Y)"
  max="$(jq -r '.opportunities[].id' "$REG" 2>/dev/null | grep "^OPP-$year-" | sed -E "s/^OPP-$year-0*([0-9]+)$/\1/" | sort -n | tail -1)"
  n=$(( ${max:-0} + 1 ))
  printf 'OPP-%s-%03d' "$year" "$n"
}

cmd_search() {
  local term="$*"
  [ -z "$term" ] && { echo "usage: registry.sh search <terms>"; exit 1; }
  echo "== DEDUP CHECKPOINT: '$term' =="
  echo "-- registry matches (id | status | score | name | industry) --"
  local hits
  hits="$(jq -r '.opportunities[] | [.id,.status,(.score|tostring),.name,.industry,.problem_category,.reasoning] | @tsv' "$REG" 2>/dev/null \
        | grep -i -- "$term" | awk -F'\t' '{printf "  %s | %s | %s | %s | %s\n",$1,$2,$3,$4,$5}')"
  [ -n "$hits" ] && echo "$hits" || echo "  (none)"
  echo "-- research file matches --"
  local files
  files="$(grep -ril -- "$term" "$ROOT"/research/{active,validated,execution,archived,rejected,market_maps} 2>/dev/null | sed "s#$ROOT/##")"
  [ -n "$files" ] && echo "$files" | sed 's/^/  /' || echo "  (none)"
  echo "== If any hit looks similar (>70% on problem/customer/workflow/economics/solution/market): UPDATE it, do not create a duplicate. See rules/research-dedup.md. =="
}

cmd_add() {
  local name="" ind="" prob="" score="" status="DISCOVERED" conf="MED" reason="" related=""
  while [ $# -gt 0 ]; do case "$1" in
    --name) name="$2"; shift 2;; --industry) ind="$2"; shift 2;; --problem) prob="$2"; shift 2;;
    --score) score="$2"; shift 2;; --status) status="$2"; shift 2;; --confidence) conf="$2"; shift 2;;
    --reasoning) reason="$2"; shift 2;; --related) related="$2"; shift 2;;
    *) log ERROR "add: unknown arg $1"; exit 1;; esac; done
  [ -z "$name" ] && { log ERROR "add: --name required"; exit 1; }
  [ -z "$score" ] && score=0
  valid_status "$status" || { log ERROR "add: invalid status '$status' (one of: $VALID_STATUS)"; exit 1; }
  local id now dir slug file
  id="$(next_id)"; now="$(iso_now)"; dir="$(status_dir "$status")"; slug="$(slugify "$name")"
  file="research/$dir/$id-$slug.md"
  # research record stub
  cat > "$ROOT/$file" <<MD
---
id: $id
name: $name
industry: $ind
problem_category: $prob
status: $status
score: $score
confidence: $conf
discovery_date: $now
last_reviewed: $now
---

# $id — $name

## Problem
$prob

## Discovery record
_(fill per prompts/opportunity-engine.md: affected customer, current solution, pain, frequency,
economic impact \$/yr, competitive landscape, AI applicability, risks, pricing, business model)_

## Scoring (0–100)
| Pain20 | Spend20 | Freq15 | AI15 | CompWk15 | Defens15 | Total |
|--------|---------|--------|------|----------|----------|-------|
|        |         |        |      |          |          | $score |

## Similarity keys (for future dedup)
- Problem: 
- Customer: 
- Workflow: 
- Economics: 
- Solution: 
- Market: 

## Evidence
**Supporting:**
**Contradicting:**
**Final assessment:**
**Confidence:** $conf

## Reasoning
$reason
MD
  reg_write --arg id "$id" --arg name "$name" --arg ind "$ind" --arg prob "$prob" \
    --arg status "$status" --argjson score "${score:-0}" --arg conf "$conf" --arg reason "$reason" \
    --arg file "$file" --arg now "$now" --arg related "$related" \
    '.opportunities += [{
        id:$id, name:$name, industry:$ind, problem_category:$prob,
        status:$status, score:$score, confidence:$conf,
        discovery_date:$now, last_reviewed:$now,
        related:($related|split(",")|map(select(length>0))),
        research_files:[$file], reasoning:$reason,
        similarity:{problem:"",customer:"",workflow:"",economics:"",solution:"",market:""}
     }] | .updated=$now'
  log INFO "registry: added $id ($status, score $score) -> $file"
  cmd_reindex >/dev/null
  echo "$id"
}

cmd_update() {
  local id="$1"; shift || true
  [ -z "$id" ] && { log ERROR "update: <ID> required"; exit 1; }
  jq -e --arg id "$id" '.opportunities[]|select(.id==$id)' "$REG" >/dev/null 2>&1 || { log ERROR "update: $id not found"; exit 1; }
  local now; now="$(iso_now)"
  local newstatus=""
  local -a filt=(--arg id "$id" --arg now "$now")
  local prog='(.opportunities[]|select(.id==$id)|.last_reviewed)=$now'
  while [ $# -gt 0 ]; do case "$1" in
    --status) newstatus="$2"; valid_status "$newstatus" || { log ERROR "bad status $newstatus"; exit 1; }
              filt+=(--arg st "$newstatus"); prog="$prog | (.opportunities[]|select(.id==\$id)|.status)=\$st"; shift 2;;
    --score)  filt+=(--argjson sc "$2"); prog="$prog | (.opportunities[]|select(.id==\$id)|.score)=\$sc"; shift 2;;
    --confidence) filt+=(--arg cf "$2"); prog="$prog | (.opportunities[]|select(.id==\$id)|.confidence)=\$cf"; shift 2;;
    --reasoning)  filt+=(--arg rs "$2"); prog="$prog | (.opportunities[]|select(.id==\$id)|.reasoning)=\$rs"; shift 2;;
    --add-file)   filt+=(--arg af "$2"); prog="$prog | (.opportunities[]|select(.id==\$id)|.research_files)+=[\$af]"; shift 2;;
    --add-related) filt+=(--arg ar "$2"); prog="$prog | (.opportunities[]|select(.id==\$id)|.related)+=[\$ar]"; shift 2;;
    *) log ERROR "update: unknown arg $1"; exit 1;; esac; done
  prog="$prog | .updated=\$now"
  reg_write "${filt[@]}" "$prog"
  # move research file if status changed the bucket
  if [ -n "$newstatus" ]; then
    local newdir; newdir="$(status_dir "$newstatus")"
    local oldfile; oldfile="$(jq -r --arg id "$id" '.opportunities[]|select(.id==$id)|.research_files[0]//empty' "$REG")"
    if [ -n "$oldfile" ] && [ -f "$ROOT/$oldfile" ]; then
      local base newfile; base="$(basename "$oldfile")"; newfile="research/$newdir/$base"
      if [ "$oldfile" != "$newfile" ]; then
        mkdir -p "$ROOT/research/$newdir"; git -C "$ROOT" mv "$oldfile" "$newfile" 2>/dev/null || mv "$ROOT/$oldfile" "$ROOT/$newfile"
        reg_write --arg id "$id" --arg of "$oldfile" --arg nf "$newfile" \
          '(.opportunities[]|select(.id==$id)|.research_files) |= map(if .==$of then $nf else . end)'
        log INFO "registry: moved $id record $oldfile -> $newfile"
      fi
    fi
  fi
  log INFO "registry: updated $id"
  cmd_reindex >/dev/null
}

cmd_show() { jq -e --arg id "$1" '.opportunities[]|select(.id==$id)' "$REG" 2>/dev/null || { echo "not found: $1"; exit 1; }; }

cmd_list() {
  local f="${1:-}"
  printf '%-14s %-20s %-6s %-5s %s\n' ID STATUS SCORE CONF NAME
  jq -r --arg f "$f" '.opportunities[] | select($f=="" or .status==$f)
      | [.id,.status,(.score|tostring),.confidence,.name] | @tsv' "$REG" \
    | awk -F'\t' '{printf "%-14s %-20s %-6s %-5s %s\n",$1,$2,$3,$4,$5}'
}

cmd_reindex() {
  local now total title states st any id name score reason files bucket m
  now="$(iso_now)"; total="$(jq '.opportunities|length' "$REG")"
  {
    echo "# RESEARCH INDEX"
    echo
    echo "> Human-readable map of all opportunities. **Generated** from \`opportunity_registry.json\`"
    echo "> by \`scripts/registry.sh reindex\` — do not hand-edit. Registry is authoritative."
    echo "> Last generated: $now · Total tracked: **$total**"
    echo
    echo "## Counts by status"
    if [ "$total" -gt 0 ]; then
      jq -r '.opportunities|group_by(.status)|map("- **\(.[0].status)**: \(length)")|.[]' "$REG"
    else echo "_(registry empty — no opportunities investigated yet)_"; fi
    echo
    echo "## Master ledger"
    echo
    echo "| ID | Name | Industry | Status | Score | Conf | Last reviewed |"
    echo "|----|------|----------|--------|-------|------|---------------|"
    jq -r '.opportunities[] | "| \(.id) | \(.name) | \(.industry) | \(.status) | \(.score) | \(.confidence) | \(.last_reviewed) |"' "$REG"
    echo
    for bucket in "ACTIVE:DISCOVERED MONITORING VALIDATING" "VALIDATED:VALIDATED" \
                  "EXECUTION:EXECUTION_CANDIDATE BUILDING DEPLOYED" "ARCHIVED:ARCHIVED" "REJECTED:REJECTED"; do
      title="${bucket%%:*}"; states="${bucket#*:}"
      echo "## $title"
      local any=0
      for st in $states; do
        while IFS=$'\t' read -r id name score reason files; do
          [ -z "$id" ] && continue; any=1
          echo "- **$id** — $name (score $score)"
          [ -n "$reason" ] && [ "$reason" != "null" ] && echo "  - why: $reason"
          [ -n "$files" ] && [ "$files" != "null" ] && echo "  - files: $files"
        done < <(jq -r --arg st "$st" '.opportunities[]|select(.status==$st)|[.id,.name,(.score|tostring),.reasoning,(.research_files|join(", "))]|@tsv' "$REG")
      done
      [ "$any" -eq 0 ] && echo "_(none)_"
      echo
    done
    echo "## Market maps"
    if ls "$ROOT"/research/market_maps/*.md >/dev/null 2>&1; then
      for m in "$ROOT"/research/market_maps/*.md; do echo "- research/market_maps/$(basename "$m")"; done
    else echo "_(none yet — create from templates/MARKET_MAP.md before researching a market)_"; fi
  } > "$INDEX"
  reg_write --arg now "$now" '.updated=$now'
  log INFO "registry: reindexed -> research/INDEX.md ($total opportunities)"
}

case "${1:-list}" in
  search)  shift; cmd_search "$@" ;;
  next-id) next_id; echo ;;
  add)     shift; cmd_add "$@" ;;
  update)  shift; cmd_update "$@" ;;
  show)    cmd_show "$2" ;;
  list)    cmd_list "$2" ;;
  reindex) cmd_reindex ;;
  *) echo "usage: registry.sh {search|next-id|add|update|show|list|reindex} ..."; exit 1 ;;
esac
