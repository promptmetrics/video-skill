#!/usr/bin/env bash
# Build a Claude.ai / Cowork-uploadable zip for the video-skill skill.
# Produces dist/video-skill.zip with the skill folder at the zip root
# (files directly at the zip root is the documented upload failure mode).
set -euo pipefail

cd "$(dirname "$0")/.."

SKILL_DIR="skills/video-skill"
SKILL_MD="$SKILL_DIR/SKILL.md"
OUT_DIR="dist"
OUT="$OUT_DIR/video-skill.zip"

if [ ! -f "$SKILL_MD" ]; then
  echo "ERROR: $SKILL_MD not found" >&2
  exit 1
fi

# Assert the folder name matches the `name` frontmatter field.
FOLDER_NAME="$(basename "$SKILL_DIR")"
NAME_FIELD="$(awk '/^name: /{sub(/^name: /,""); print; exit}' "$SKILL_MD")"
if [ "$FOLDER_NAME" != "$NAME_FIELD" ]; then
  echo "ERROR: folder name '$FOLDER_NAME' != frontmatter name '$NAME_FIELD'" >&2
  exit 1
fi

# Assert the description is <= 200 chars (Claude.ai/Cowork upload limit).
DESC="$(awk '/^description: /{sub(/^description: /,""); print; exit}' "$SKILL_MD")"
DESC_LEN="${#DESC}"
if [ "$DESC_LEN" -gt 200 ]; then
  echo "ERROR: description is $DESC_LEN chars (limit 200 for Claude.ai/Cowork)" >&2
  exit 1
fi
echo "OK: name='$NAME_FIELD', description=${DESC_LEN} chars (<=200)"

# Run the official validator if available; otherwise warn (non-fatal).
if command -v skills-ref >/dev/null 2>&1; then
  echo "Running skills-ref validate..."
  skills-ref validate "$SKILL_DIR" || echo "WARN: skills-ref reported issues (review before upload)" >&2
else
  echo "NOTE: 'skills-ref' not installed — skipping validation. Install from https://github.com/agentskills/agentskills/tree/main/skills-ref"
fi

ABS_OUT="$PWD/$OUT_DIR/video-skill.zip"
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"
rm -f "$ABS_OUT"

# Zip from skills/ so the skill folder sits at the zip root.
( cd skills && zip -rq "$ABS_OUT" "video-skill" )

echo "Built $OUT"
echo "Top-level entries:"
unzip -l "$OUT" | awk 'NR>3 && $4 ~ /\// {print $4}' | sort -u | head -5