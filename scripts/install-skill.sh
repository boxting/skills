#!/usr/bin/env bash
# Copy-install a skill without the plugin system.
# Usage: scripts/install-skill.sh <skill-name> [--user | --project <path>]
#   --user            -> ~/.claude/skills/<skill-name>        (all your projects)
#   --project <path>  -> <path>/.claude/skills/<skill-name>   (commit it to share with that repo's team)
set -euo pipefail
NAME="${1:?skill name, e.g. boxting-brag}"; MODE="${2:---user}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$(find "$ROOT/plugins" -type d -path "*/skills/$NAME" | head -1)"
[ -n "$SRC" ] || { echo "skill '$NAME' not found under plugins/*/skills/"; exit 1; }
case "$MODE" in
  --user) DEST="$HOME/.claude/skills/$NAME" ;;
  --project) DEST="$(cd "${3:?project path}" && pwd)/.claude/skills/$NAME" ;;
  *) echo "use --user or --project <path>"; exit 1 ;;
esac
rm -rf "$DEST"; mkdir -p "$(dirname "$DEST")"; cp -R "$SRC" "$DEST"
echo "installed $NAME -> $DEST (restart Claude Code or run /skills to see it)"
