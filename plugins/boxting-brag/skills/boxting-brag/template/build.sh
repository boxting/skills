#!/usr/bin/env bash
# Generates ../composition-landscape and ../composition-vertical from this template.
# Usage: bash template/build.sh [lang]   (lang defaults to "es")
set -euo pipefail
cd "$(dirname "$0")"
LANG_CODE="${1:-es}"

# sfx.txt lines: time|file-in-assets/sfx|volume   (# comments allowed)
tags=""
i=0
while IFS='|' read -r t f v; do
  t="${t%%#*}"; t="$(echo "$t" | xargs)"
  [ -z "$t" ] && continue
  i=$((i + 1))
  tags+="<audio id=\"sfx-$i\" data-start=\"$t\" data-track-index=\"$((10 + i))\" data-volume=\"$v\" src=\"assets/sfx/$f\"></audio>"$'\n      '
done < sfx.txt

build() {
  local fmt=$1 w=$2 h=$3 dir="../composition-$4"
  rm -rf "$dir"; mkdir -p "$dir"
  cp -R assets "$dir/"
  SFXTAGS="$tags" W=$w H=$h FMT=$fmt LANGC=$LANG_CODE python3 - "$dir/index.html" <<'PY'
import os, sys
s = open("index.html").read()
for k, env in (("W", "W"), ("H", "H"), ("FMT", "FMT"), ("LANG", "LANGC")):
    s = s.replace("__%s__" % k, os.environ[env])
s = s.replace("__SFX__", os.environ["SFXTAGS"])
open(sys.argv[1], "w").write(s)
PY
}

build land 1920 1080 landscape
build vert 1080 1920 vertical
echo "built composition-landscape and composition-vertical ($i sfx cues)"
