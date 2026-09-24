# Brag Plan: AVA Cash

## What is this app?
AVA Cash lets drivers earn soles back every time they buy at an AVA service station, then spend that balance at checkout, all from their phone.

## The angle
An orientation tour for a new user, told from their point of view: open the app → see your balance → show your QR at checkout and earn → pay with Avacoins → find a station → check the deals. Every scene is the real app in use, and a finger taps through the bottom nav (Inicio → Escanear → Canjear → Ubícanos → Promociones) the way a user would. There is no tech talk. The copy is Spanish, like the app and its audience.

## Hook (0–3s)
Big purple frame, Lexend display type: **"Cada vez que cargas,"** then **"ganas."** lands in AVA yellow on a beat with a soft impact. The phone rises in from below as the hook exits.

## Key moments
- Balance counts up **S/.0.00 → S/.48.60 "Soles acumulados"** with a chip-stack sound, then the activity rows ("Ganaste en…", "Canjeaste en…") drop in one by one.
- **"Muestra el código!"**: the QR draws itself in, a cashier scan-line sweeps it, and a toast pops: "¡Ganaste S/ 3.50!"
- **Canjear**: the user types 15.00, taps "Generar código", and the payment QR lands on the strongest music cue (17.52s).
- The stations map drops AVA pins and the "Estaciones de servicio" sheet slides up.
- The promotions carousel shows the combo for S/ 9.90.

## Outro
The AVA Cash thumbs-up logo pops in, followed by **"Carga. Acumula. Canjea."** and **"Descarga AVA Cash"**.

## User flow worth showing
Open app (balance + activity) → show identity QR at checkout → earn → redeem with a payment QR → locate station → promotions.

## Tone
- Preset: app-store
- Creative direction: friendly orientation tour for new users; warm, clear, interactive
- Interpretation: one feature per scene, a short Spanish headline plus one line of support, simulated taps drive every transition, and the text holds long enough to read.

## Format: landscape 1920x1080 **and** vertical 1080x1920
## Duration: 30s (the user asked for 30s, which overrides the 15–25s default)

## Visual identity (from `lib/common/colors/ava_colors.dart` + Play Store art)
- Background: #6a1f75 (AvaColors.primary), deepened to #4a1352
- Accent: #F6D300 (AvaColors.secondary)
- Highlight: #0E5B7A; cream blob #FBE3A8 (from store screenshots)
- Text: #FFFFFF on purple; the in-phone UI is shadcn-style dark on white
- Display font: Lexend (matches the Play Store screenshots). Body/UI font: Inter
- Strongest visual element: the in-app QR card and the balance count-up

## Share copy (draft)
Carga, acumula y canjea: AVA Cash devuelve soles en cada compra en estaciones AVA.

## Audio direction
- Role: warm, upbeat bed with a consistent light UI layer
- Music: happy-beats-business-moves-vol-1 (120 BPM), vol ~0.35, fade in over 0.4s, fade out 28.5→30s
- Music cue guidance: preset `happy-beats-business-moves-vol-1-by-ende-dot-app.music-cues.json`. Beats fall on x.02/x.52. Strong cue lock at 17.52s (payment QR). Activity rows go on the beat grid at 5.03/5.53/6.03 (short rows, held on screen afterward). The map pins drop on 20.52/21.02/21.52.
- Audio-reactive: subtle. The glow behind the phone breathes with bass RMS. No visualizers.
- SFX posture: moderate. Taps get clicks, typing gets keypresses, rows get card sounds, earning gets chips, the logo gets a bell.
- Restraint: no sound on every caption change.

## Storyboard (7 scenes = 30s)
1. **Hook** (0–3s): "Cada vez que cargas, / ganas." The phone rises at 2.7s. SFX: soft impact on "ganas."
2. **Inicio** (3–9s): Caption "Tu saldo, siempre a la vista" / "Mira cuánto acumulaste y cada movimiento." Greeting "Buenas tardes, Lucía" (fictional name), the balance counts up, and 3 activity rows arrive one by one. A tap on "Escanear" happens at 8.4s.
3. **Acumula** (9–15s): Caption "Muestra tu QR y acumula" / "Identifícate en caja y gana soles en cada compra." The QR draws in, a scan-line sweeps it, and the "¡Ganaste S/ 3.50!" toast appears at 12.02s. A tap on the "Canjear" tab happens at 14.5s.
4. **Canjea** (15–20s): Caption "Paga con tus Avacoins" / "Elige el monto, genera tu código y listo." The user types "15.00" and taps "Generar código", then a progress bar runs and the QR lands at 17.52s (beat-locked). A tap on "Ubícanos" happens at 19.5s.
5. **Ubícanos** (20–24s): Caption "Encuentra tu estación AVA" / "Todas las estaciones cerca de ti, en el mapa." Pins drop and the station sheet slides up. A tap on "Promociones" happens at 23.5s.
6. **Promociones** (24–27s): Caption "Ofertas solo para ti" / "Combos y descuentos exclusivos." The promo banner slides in and the price badge pops.
7. **Outro** (27–30s): The phone exits. Logo, "Carga. Acumula. Canjea.", "Descarga AVA Cash". SFX: bell.

Privacy: every name, station, amount, and QR payload is a fictional stand-in. No real user data is used.
