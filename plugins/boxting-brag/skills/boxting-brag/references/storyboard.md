# Step 2 — Plan the orientation video

Write `<out>/plan.md`. It is the creative contract for the composition.

## Shape (30s default)

| Scene | Time | Content |
|---|---|---|
| Hook | 0–3s | One user-benefit line in two parts. The second part slams in the accent color on the 1.02s beat. The device rises in at 2.65s. |
| Feature 1 (home) | 3–9s | The landing screen: a greeting, the key number counting up, a list arriving row by row |
| Feature 2 (hero action) | 9–15s | The core interaction: tap, type, confirm → success toast on a beat |
| Feature 3 (hero result) | 15–20s | The payoff screen (QR, receipt, quote, booking), landing on the strong cue at **17.52s** |
| Feature 4 | 20–24s | A secondary feature (map, history, catalog) |
| Feature 5 | 24–27s | A secondary feature (promos, profile) |
| Outro | 27–30s | Logo, a three-beat promise ("Carga. Acumula. Canjea."), a CTA pill |

For 20–25s, drop features 4–5. For 40s, add one feature.

## Music grid (bundled track, 120 BPM)

Beats fall on **x.02 and x.52**. Strong cues are 16.02, 17.02, 17.52, 18.52, 20.02, 21.01, 22.01, 23.02, 23.52 and 27.02.
- Put 1–3 major payoffs on strong cues. Mark them `// beat-locked` in code.
- Space sequential items (rows, pins) 0.5s apart on the grid, then hold them on screen.

## Transition rhythm between feature scenes

At the end of scene N (scene boundary T):

| When | What happens |
|---|---|
| T-0.8 | Tap or click on the next nav item (`tapAt`). |
| T-0.65 | The nav pill moves (`navTo`). |
| T-0.55 | The screens swap (`swapScreen`). |
| T-0.45 | The caption exits (`capOut`). |
| T | The next caption enters (`capIn`). |

## Copy rules

- **Kicker:** the nav or section name in uppercase, in the product language (INICIO, ACUMULA, UBÍCANOS).
- **Title:** the user benefit in 3–6 words ("Paga con tus Avacoins"). Not a feature name, not jargon.
- **Sub:** one plain sentence, 6–10 words.
- **Hook:** a benefit-led promise ("Cada vez que cargas, / ganas.").
- **Outro:** a three-word rhythm plus a CTA ("Descarga <App>"). Name an app store only if the app is actually listed there.
- **Banned:** stack names, "built with", "seamless", "streamline", "powerful", "revolutionary", "next-gen", and any architecture words.

## Plan file skeleton

```markdown
# Orientation video: <App>
## Angle            (one paragraph, user POV)
## Hook             (exact copy)
## Scenes           (per scene: time, kicker/title/sub, screen recreated, interaction, sfx intent)
## Outro            (exact copy)
## Visual identity  (tokens, device, logo)
## Fictional data   (what was invented)
## Share copy draft
```
