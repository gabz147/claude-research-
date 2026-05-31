#!/usr/bin/env bash
# ingest_doc.sh <path-or-url> [output-name]
# Convert a PDF / office doc / html into markdown under research/sources/ for use as research evidence.
# Uses microsoft/markitdown (pip). Falls back to a clear error if unavailable.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=lib.sh
. "$DIR/lib.sh"
SRC_DIR="$ROOT/research/sources"
mkdir -p "$SRC_DIR"

in="${1:?usage: ingest_doc.sh <path-or-url> [output-name]}"
name="${2:-$(basename "${in%%\?*}")}"
out="$SRC_DIR/${name%.*}.md"

if ! python3 -c "import markitdown" 2>/dev/null; then
  log ERROR "ingest_doc: markitdown not installed. Run: pip install markitdown --break-system-packages"
  exit 1
fi

tmp=""
if printf '%s' "$in" | grep -qE '^https?://'; then
  tmp="$(mktemp --suffix=".${in##*.}")"
  curl -fsSL "$in" -o "$tmp" || { log ERROR "ingest_doc: download failed: $in"; exit 1; }
  in="$tmp"
fi

if python3 -c "
import sys
from markitdown import MarkItDown
md = MarkItDown()
r = md.convert(sys.argv[1])
open(sys.argv[2],'w').write('# Source: %s\n\n' % sys.argv[3] + r.text_content)
" "$in" "$out" "$name"; then
  log INFO "ingest_doc: wrote $out ($(wc -l < "$out") lines)"
  echo "$out"
else
  log ERROR "ingest_doc: conversion failed for $in"; exit 1
fi
[ -n "$tmp" ] && rm -f "$tmp"
