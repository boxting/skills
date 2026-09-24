# Step 1 — Inspect the project

The goal is to understand the product the way a user experiences it. Read the code, not just the README.

## Find, in this order

1. **Navigation.** This is the spine of the video.
   - Flutter: the router file (`app_router.dart`, `GoRouter`, `NavigationBar`/`BottomNavigationBar` items with `label:` + `icon:`).
   - React/Next: the layout/sidebar/header nav, the `app/` or `pages/` routes.
   - Record every destination **in app order** with its exact label and icon (Lucide names map directly to https://lucide.dev SVGs).
2. **Screens behind each destination.** Collect the exact on-screen strings: titles, card titles and descriptions, button labels, empty states, toasts. Check the `l10n`/`i18n` files when strings are keys.
3. **The hero flow.** Find the one thing users come for (earn points, get a quote, book, pay). Map it as entry → action → result, including the real intermediate states (input → loading/progress → success/QR/toast).
4. **Brand.**
   - Colors: a theme/colors file (`AvaColors`, `theme.dart`, `tailwind.config`, CSS `:root` vars).
   - Fonts: the theme or Google Fonts import. Lexend + Inter are bundled; only bring another font if the brand clearly requires it, and ship it locally with `@font-face`.
   - Logo: `assets/`, `public/`, store screenshots (`playstore/`, `appstore/`). These also reveal the brand's marketing style.
5. **Store and marketing art**, if present. Reuse its headline tone and decorative shapes (the blobs in the template came from Ava Cash's Play Store screenshots).
6. **Audience and language.** The UI language is the video language.

## Skip

Build output, lock files, tests, `.env*`, keys, credentials, and anything gitignored for secrecy.

## Write down before planning

```
Product (1 line, user words):
Language:
Device: phone | browser
Brand: brand / brand-deep / accent / accent-ink / ui-brand / ui-brand-soft (hex)
Logo file:
Nav (ordered): label — icon — screen file
Hero flow: entry → action → result (with real labels)
Secondary features worth 1 scene each (max 3):
Real strings to show verbatim:
Fictional stand-ins needed (names, amounts, places):
```

Contrast rule: `accent-ink` on `accent` and white on `brand` must reach 4.5:1. In-app colored text such as amounts and links must reach 4.5:1 on white; use darker shades than the Material defaults (for example `#1976d2`, not `#2196f3`).
