# Step 4 — Render and deliver

```bash
bash <skill-dir>/scripts/render.sh "$OUT" <poster-seconds> <lang>
```

`render.sh` runs these steps in order:
1. Generates `template/assets/js/audio-bass.js` if it is missing. This needs ffmpeg and numpy, and uses `uv` when available. If generation fails, the glow stays static.
2. Runs `build.sh`, then `npx hyperframes check` for both formats. It stops on any error.
3. Renders `video-landscape.mp4` and `video-vertical.mp4` at `--quality delivery`, about 20s each on a Mac.
4. Extracts `poster-<fmt>.jpg` at the poster time and bakes it in as frame 0, so Slack, WhatsApp and X thumbnails show a real frame.

Poster time: choose a settled frame from the hero flow's payoff, where the caption is fully in and the success state is visible (for example 12.6s in Ava Cash).

Verify the output:
```bash
ffprobe -v error -show_entries format=duration:stream=codec_type -of compact "$OUT/video-landscape.mp4"
```
Expect 30.0s with a video stream and an audio stream.

## Share copy

Write `$OUT/share-copy.txt` in the product language, 1–3 sentences:
```
<App> ya está disponible. <Benefit 1>, <benefit 2> y <benefit 3>, todo desde tu celular. <Outro promise>.
```

## Repo hygiene

Add `$OUT/.gitignore` containing `composition-landscape/` and `composition-vertical/`. Those folders are generated. Commit `template/`, `plan.md`, the videos, the posters, and the share copy only if the team wants the videos versioned.

## Report to the user

Tell the user:
- Where the two videos and the posters are.
- One line per scene describing what it shows.
- The assumptions made: language, fictional data, CTA wording.
- How to iterate: edit `template/index.html`, then rerun `render.sh`.
