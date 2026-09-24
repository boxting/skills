# Step 3 — Compose (HyperFrames)

The template is a standalone HyperFrames composition. `build.sh` stamps `__W__`/`__H__`/`__FMT__`/`__LANG__`/`__SFX__` to generate both formats. **Edit only `template/`**. The `composition-*` folders are generated and overwritten on every build.

## Editing map

| Section in `index.html` | What to change |
|---|---|
| `:root` brand tokens | The project's colors (keep the contrast rules from inspect.md) |
| `#root` class | `dev-phone` or `dev-browser` |
| `#hook` | The logo and the two hook lines |
| `.caps` | One `.cap` per feature scene, with ids `cap1..capN` |
| `.content` | One `.scr` per screen, recreated from the real UI with the reusable classes |
| `.nav` | One `.nav-item` per real destination (Lucide SVG plus the exact label). On a phone, 4–5 items fit. |
| `#outro` | The logo, the promise, and the CTA |
| TIMELINE block | The scene choreography (see storyboard.md) |
| `gsap.set([...], {opacity:0})` | Every screen except the first, plus toasts and later-state panels |

Put the project logo at `template/assets/img/logo.png`. Use a wide or lockup logo for the outro if one exists; change `#outroLogo`'s `src` for it.

## Helpers (already in the template)

| Helper | What it does |
|---|---|
| `tapAt(el, t)` | Finger tap (phone) or cursor glide and click (browser) on the element's center |
| `navTo(i, t)` | Moves the nav pill to item `i` and recolors the labels |
| `swapScreen(from, to, t)` | Slide and crossfade between screens |
| `capIn(id, t)` / `capOut(id, t)` | Staggered caption in and out |
| `countUp(sel, to, t, fmt, dur)` | Number count-up. Format with the project's locale and currency. |
| `typeText(sel, text, t, perChar)` | Types into an input. Show the caret first. |
| `stagger([sels], t0, step)` | Rows arriving one by one (step 0.5 = beat grid) |
| `drawQR(svg, seed)` | A deterministic fake QR. Never encode real data. |

You can add screen-specific tweens freely (clipPath wipes, scan lines, pins dropping with `bounce.out`, a sheet sliding up, a badge popping with `back.out`).

## HyperFrames rules that bite

- The composition runs on one paused GSAP timeline, registered at `window.__timelines["main"]` at the **end** of the `document.fonts.ready` callback.
- Set initial hidden states with `gsap.set(...)` outside the timeline, not with `tl.set(..., 0)`.
- Never tween `visibility`/`display`/`autoAlpha` on a `.clip` section. Animate the children.
- Never combine a CSS `transform` with a GSAP transform on the same element. `.device-wrap` is CSS-scaled; GSAP animates `#device` inside it.
- No `Math.random`, no `Date.now`, no network, no `repeat: -1`.
- Every `<audio>` needs an `id` (`build.sh` handles this for SFX).
- Fonts must be local `@font-face` files.
- Toasts and overlays must not sit on top of other text, or `check` fails with `content_overlap`. Put toasts at the bottom of the screen.
- Decorative shapes that bleed off-canvas carry `data-layout-allow-overflow`.
- Keep text in the recreated UI at 12px or more (phone) or 13px or more (browser), because the device renders close to 1:1.

## Loop

```bash
bash $OUT/template/build.sh es
(cd $OUT/composition-landscape && npx hyperframes check)
(cd $OUT/composition-vertical  && npx hyperframes check)
(cd $OUT/composition-landscape && npx hyperframes snapshot --at 1.8,6.5,12.5,18.4,22.5,25.5,29)
```

Read `snapshots/contact-sheet.jpg` for both formats. Common fixes:
- A decorative blob covers the hook or outro text: move or shrink the `.blob-*` for that format.
- A caption wraps badly: shorten the copy; don't shrink the font below the template sizes.
- A tap misses its target: the target must be laid out (only opacity-hidden) when the timeline is built.

The known, acceptable `check` warnings are `composition_file_too_large`, `nested_structure_needs_subcomposition`, and `duplicate_media_discovery_risk` for the repeated logo.
