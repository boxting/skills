# Audio

## Music

`template/assets/music/track.mp3` is "Happy Beats / Business Moves vol. 1" by ende.app: 120 BPM, with beats on x.02 and x.52. It is wired as `#music` at volume 0.35, with a lane fade-in from 0 to 0.4s and a fade-out from 28.4 to 30s. If you change the duration, update the automation points and `data-duration`.

To use a different track, replace `track.mp3`, then delete `assets/js/audio-bass.js` so `render.sh` regenerates the audio-reactive data. Detect the new beats with `npx hyperframes beats <composition-dir>` and retime the beat-locked moments.

## SFX (`template/sfx.txt`, format `time|file|volume`)

| Moment | File | Volume |
|---|---|---|
| Hook punch word | `impactSoft_medium_001.ogg` | 0.8 |
| Device enters, sheet or banner slides | `card-slide-1.ogg` | 0.5–0.55 |
| Count-up | `chips-stack-1.ogg` | 0.7 |
| Rows or pins arriving (first and last only, or each pin) | `drop_001/002/003.ogg` | 0.6 |
| Tap or click (at `tapAt` time + 0.08) | `click2.ogg` | 0.75 |
| Typing, one per character, rotating files | `keypress-*.wav` | 0.55–0.6 |
| Success toast | `chips-collide-1.ogg` | 0.75 |
| Hero payoff (QR, receipt) | `chip-lay-1.ogg` | 0.8 |
| Logo in the outro | `impactBell_heavy_000.ogg` | 0.7 |

Rules:
- Start each sound at the **start** of its visual.
- Don't add a sound for caption changes.
- Keep the SFX volume at 0.85 or below.
- Keep the total count around 15–25 in 30s.
