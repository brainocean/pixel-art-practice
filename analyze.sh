#!/usr/bin/env bash
# Usage: ./analyze.sh <file.aseprite>
# Exports 1x PNG, prints pixel grid + symmetry check (both axis types).

set -euo pipefail

ASE=/Applications/Aseprite.app/Contents/MacOS/aseprite

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <file.aseprite>" >&2
  exit 1
fi

src="$1"
tmp=$(mktemp /tmp/analyze-XXXXXX.png)
trap "rm -f $tmp" EXIT

"$ASE" -b "$src" --save-as "$tmp" 2>/dev/null

python3 - "$tmp" <<'PYEOF'
import sys
from PIL import Image

img = Image.open(sys.argv[1]).convert("RGBA")
px = img.load()
w, h = img.size

def is_filled(x, y):
    r, g, b, a = px[x, y]
    return a > 0 and (r + g + b) < 384

def pixel_char(x, y):
    r, g, b, a = px[x, y]
    if a == 0: return "·"
    s = r + g + b
    if s >= 600: return "□"
    if s < 384: return "■"
    return "▪"

# Print grid
print(f"Canvas: {w}×{h}\n")
for y in range(h):
    print(f"{y:2d}: {''.join(pixel_char(x, y) for x in range(w))}")

# Try on-column axis (odd-width centers like star tips)
def check_on_col(center):
    ok = 0; total = 0
    for y in range(h):
        row_ok = True
        for d in range(1, max(center, w - center) + 1):
            lx, rx = center - d, center + d
            if lx < 0 and rx >= w: break
            l = is_filled(lx, y) if 0 <= lx < w else False
            r = is_filled(rx, y) if 0 <= rx < w else False
            total += 1
            if l == r: ok += 1
            else: row_ok = False
    return ok / total if total else 0

# Try between-column axis (mirror: col x <-> col w-1-x)
def check_mirror():
    ok = 0; total = 0
    for y in range(h):
        for x in range(w // 2):
            total += 1
            if is_filled(x, y) == is_filled(w - 1 - x, y):
                ok += 1
    return ok / total if total else 0

# Find best axis
best_type = None; best_center = None; best_score = 0

# Check all on-column axes
for c in range(w):
    s = check_on_col(c)
    if s > best_score:
        best_score = s; best_center = c; best_type = "column"

# Check mirror axis
ms = check_mirror()
if ms > best_score:
    best_score = ms; best_center = None; best_type = "mirror"

if best_type == "mirror":
    print(f"\nCenter axis: between columns {w//2-1} and {w//2} (symmetry: {best_score:.1%})")
    print(f"\n--- Mirror symmetry (col x ↔ col {w-1}-x, shape only) ---")
    asym = []
    for y in range(h):
        sym = all(is_filled(x, y) == is_filled(w-1-x, y) for x in range(w//2))
        mark = "✓" if sym else "✗"
        if not sym: asym.append(y)
        print(f"Row {y:2d}: {mark}")
else:
    print(f"\nCenter axis: column {best_center} (symmetry: {best_score:.1%})")
    print(f"\n--- Symmetry around column {best_center} ---")
    asym = []
    for y in range(h):
        sym = True
        for d in range(1, max(best_center, w - best_center) + 1):
            lx, rx = best_center - d, best_center + d
            if lx < 0 and rx >= w: break
            l = is_filled(lx, y) if 0 <= lx < w else False
            r = is_filled(rx, y) if 0 <= rx < w else False
            if l != r: sym = False; break
        mark = "✓" if sym else "✗"
        if not sym: asym.append(y)
        print(f"Row {y:2d}: {mark}")

if asym:
    print(f"\n⚠️  不对称行: {asym}")
else:
    print(f"\n✅ 完全对称")
PYEOF
