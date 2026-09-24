#!/usr/bin/env bash
# Build, check, render both formats, pick poster, bake poster as frame 0.
# Usage: render.sh <output-dir> [poster-seconds=12.6] [lang=es]
set -euo pipefail
OUT="$(cd "$1" && pwd)"; POSTER_AT="${2:-12.6}"; LANG_CODE="${3:-es}"
HERE="$(cd "$(dirname "$0")" && pwd)"

# audio-reactive data (optional: glow stays static if this fails)
if [ ! -s "$OUT/template/assets/js/audio-bass.js" ]; then
  if command -v uv >/dev/null; then
    uv run -q --with numpy python "$HERE/extract_bass.py" "$OUT/template/assets/music/track.mp3" "$OUT/template/assets/js/audio-bass.js" || true
  else
    python3 "$HERE/extract_bass.py" "$OUT/template/assets/music/track.mp3" "$OUT/template/assets/js/audio-bass.js" || true
  fi
  [ -s "$OUT/template/assets/js/audio-bass.js" ] || echo "window.BRAG_BASS=[];" > "$OUT/template/assets/js/audio-bass.js"
fi

bash "$OUT/template/build.sh" "$LANG_CODE"

for fmt in landscape vertical; do
  (cd "$OUT/composition-$fmt" && npx --yes hyperframes check) || { echo "check failed for $fmt — fix before rendering"; exit 1; }
done

for fmt in landscape vertical; do
  (cd "$OUT/composition-$fmt" && npx --yes hyperframes render --quality delivery --output "$OUT/video-$fmt.mp4")
  ffmpeg -loglevel error -y -ss "$POSTER_AT" -i "$OUT/video-$fmt.mp4" -frames:v 1 -q:v 2 "$OUT/poster-$fmt.jpg"
  ffmpeg -loglevel error -y -i "$OUT/video-$fmt.mp4" -i "$OUT/poster-$fmt.jpg" \
    -filter_complex "[0:v][1:v]overlay=0:0:enable='eq(n,0)'[v]" \
    -map "[v]" -map '0:a?' -c:v libx264 -crf 18 -preset slow -pix_fmt yuv420p \
    -c:a copy -movflags +faststart "$OUT/video-$fmt.poster.mp4"
  mv "$OUT/video-$fmt.poster.mp4" "$OUT/video-$fmt.mp4"
done
echo "done: $OUT/video-landscape.mp4 $OUT/video-vertical.mp4"
