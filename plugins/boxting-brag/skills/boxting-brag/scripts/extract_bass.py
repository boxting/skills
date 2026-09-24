#!/usr/bin/env python3
"""Pre-extract per-frame bass energy (0-1) for the audio-reactive glow.

Usage: extract_bass.py <audio> <out.js> [seconds=30] [fps=30]
Writes `window.BRAG_BASS=[...]` (one value per frame). Needs ffmpeg + numpy.
"""
import json
import subprocess
import sys

import numpy as np

src, out = sys.argv[1], sys.argv[2]
dur = float(sys.argv[3]) if len(sys.argv) > 3 else 30.0
fps = int(sys.argv[4]) if len(sys.argv) > 4 else 30
sr, win = 22050, 4096

raw = subprocess.run(
    ["ffmpeg", "-loglevel", "error", "-t", str(dur), "-i", src, "-ac", "1", "-ar", str(sr), "-f", "s16le", "-"],
    capture_output=True, check=True,
).stdout
x = np.frombuffer(raw, np.int16).astype(np.float32) / 32768.0
hann = np.hanning(win)
band = (np.fft.rfftfreq(win, 1 / sr) >= 30) & (np.fft.rfftfreq(win, 1 / sr) <= 160)

vals = []
for i in range(int(dur * fps)):
    c = int((i + 0.5) * sr / fps)
    seg = x[max(0, c - win // 2): max(0, c - win // 2) + win]
    if len(seg) < win:
        seg = np.pad(seg, (0, win - len(seg)))
    vals.append(float(np.sqrt(np.mean(np.abs(np.fft.rfft(seg * hann))[band] ** 2))))

v = np.array(vals)
lo, hi = np.percentile(v, 5), np.percentile(v, 98)
v = np.clip((v - lo) / (hi - lo + 1e-9), 0, 1)
with open(out, "w") as f:
    f.write("window.BRAG_BASS=" + json.dumps([round(float(a), 2) for a in v], separators=(",", ":")) + ";")
print(f"wrote {len(v)} frames to {out}")
