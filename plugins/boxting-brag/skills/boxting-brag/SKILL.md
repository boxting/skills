---
name: boxting-brag
description: Create a ~30s user-focused orientation video (landscape 1920x1080 AND vertical 1080x1920) that tours a Boxting project's main features as an interactive device mockup — simulated taps/clicks, typed input, counters — with music and SFX, rendered with HyperFrames. Use when someone asks for an orientation/onboarding/tour/promo/showcase video of the current app, "/boxting-brag", or "make a video of this project". No technical details, no stack mentions — the audience is the app's end users.
---

# /boxting-brag

Turn the current project (mobile app, web app, or site) into a **30-second orientation video for end users**, in **two formats** from one source: landscape and vertical. It shows the product being used: a finger taps (phone) or a cursor clicks (browser) through the real navigation, screens swap, and values count up, type in, and confirm.

`<skill-dir>` is the directory that contains this file. Everything you need is bundled here:

| Path | What it is |
|---|---|
| `template/index.html` | Composition scaffold: brand tokens, hook, captions, phone/browser device, nav, tap/cursor, helpers, outro |
| `template/build.sh` | Generates `composition-landscape/` and `composition-vertical/` from the template + `sfx.txt` |
| `template/sfx.txt` | SFX cue sheet (`time|file|volume`) |
| `template/assets/` | Fonts (Lexend, Inter), GSAP, music (`track.mp3`, 120 BPM), SFX |
| `scripts/extract_bass.py` | Audio-reactive data for the glow |
| `scripts/render.sh` | build → check → render both → poster → bake poster as frame 0 |
| `examples/ava-cash/` | A complete, shipped example (Flutter app, Spanish): plan + final `index.html` + `sfx.txt` + posters |
| `references/*.md` | Detailed guidance per step |

## Arguments

`/boxting-brag [--duration 30] [--lang es|en] [--device phone|browser] [--tone ...] [free text]`

- Duration defaults to **30s**. Keep it between 20 and 40s.
- Language defaults to **the language of the product UI**. Boxting apps are usually Spanish (Perú).
- The device is inferred from the project: Flutter, React Native, iOS or Android means `phone`. A web app or dashboard means `browser`.
- Always produce both formats unless the user asks for only one.

## Non-negotiables (from the user brief that created this skill)

1. **User-focused, not technical.** Never mention the stack, frameworks, architecture, APIs, BLoC, packages, or "built with". Talk about what the user **gets**: save, earn, find, pay, track.
2. **Show the product in use.** Every feature scene recreates a real screen from the codebase, with its real labels, and simulates an interaction (a tap, a type, a count-up, a list arriving, a toast confirming).
3. **Interactive.** Navigation happens through the app's own nav. The tap or click lands on the real nav item, and the screen changes.
4. **Readable.** Each caption is a kicker (the nav or section name), a title (the benefit, 3–6 words), and a sub (one plain sentence). Text holds for at least 0.3s per word after it enters.
5. **No real personal data.** Use fictional names, amounts, and addresses. Never render a real QR payload, token, email, or internal URL.

## Workflow

### 1 — Inspect → `references/inspect.md`
Find the brand (colors, fonts, logo), the nav destinations, and the 3–5 core user flows. Read the screen code for exact labels.
**Gate:** you can list each nav item with its label and icon, the hero flow (entry → action → result), and the brand tokens.

### 2 — Plan → `references/storyboard.md`
Write `<out>/plan.md` with the angle, the hook, and a scene-by-scene storyboard on the 120 BPM beat grid. The scene durations must sum to the target.
**Gate:** the plan exists, the copy is in the product's language, and there are no technical terms.

### 3 — Compose → `references/compose.md` + `references/audio.md`
```bash
OUT=<project>/orientation-video        # timestamp suffix if it already exists
mkdir -p "$OUT" && cp -R <skill-dir>/template "$OUT/template"
cp <project logo> "$OUT/template/assets/img/logo.png"
```
Then edit `$OUT/template/index.html`:
- Set the brand tokens.
- Set `dev-phone` or `dev-browser` on `#root`.
- Write the hook, captions, and outro copy.
- Recreate each screen inside `.content` with the reusable classes (`.card`, `.row`, `.input`, `.btn`, `.toast`, and so on).
- Rebuild the nav items to match the app.
- Rewrite the TIMELINE section using the helpers (`tapAt`, `navTo`, `swapScreen`, `capIn`/`capOut`, `countUp`, `typeText`, `stagger`, `drawQR`).
- Update `sfx.txt` so every cue matches its visual.

Use `examples/ava-cash/index.html` as the reference for a finished, dense version. Note: it predates the generic template, so it uses `#phone`, `AVA_BASS`, and the music file name. Copy its patterns, not its file.
**Gate:** `bash $OUT/template/build.sh <lang>`, then `npx hyperframes check` passes in both `composition-*` folders. Snapshots at the scene midpoints look right (`npx hyperframes snapshot --at ...`); open the contact sheets and actually look at them.

### 4 — Deliver → `references/deliver.md`
```bash
bash <skill-dir>/scripts/render.sh "$OUT" <poster-seconds> <lang>
```
Pick the poster time from the strongest settled frame, usually the hero flow's payoff. Write `$OUT/share-copy.txt`: 1–3 sentences in the product language, benefit-led, with no stack.
**Gate:** `video-landscape.mp4` and `video-vertical.mp4` exist, are 30s long, and have audio. Posters exist and are baked in as frame 0.

Then tell the user where the files are and what each scene shows, and list any assumptions (language, fictional data, CTA wording). Offer to open the folder.
