#!/usr/bin/env bash
# tool/render_splash_text.sh
#
# Renders the splash's two Arabic lines to transparent PNGs at 3x, using the
# app's own Tajawal fonts, so `tool/build_splash_lottie.dart` can embed them as
# Lottie image layers.
#
# They can't be Lottie *text* layers: no Lottie renderer does Arabic shaping or
# RTL, so the glyphs come out disconnected and reversed. Headless Chrome does
# the shaping correctly, and two still PNGs cost only a few KB.
#
# Usage:  bash tool/render_splash_text.sh
#         dart run tool/build_splash_lottie.dart
#
# Edit the strings below if the wording changes, then re-run both.

set -euo pipefail
cd "$(dirname "$0")/.."

TITLE="دوريفي X"
SUBTITLE="منصتك الرياضية الشاملة"

OUT="build/txt"
mkdir -p "$OUT"

FONTDIR="$(cygpath -m "$PWD/assets/fonts" 2>/dev/null || echo "$PWD/assets/fonts")"
CHROME="${CHROME:-/c/Program Files/Google/Chrome/Application/chrome.exe}"
if [ ! -x "$CHROME" ]; then
  echo "Chrome not found at: $CHROME" >&2
  echo "Set CHROME=/path/to/chrome and re-run." >&2
  exit 1
fi

# $1 out-name  $2 font-file  $3 css-size  $4 weight  $5 letter-spacing
# $6 box-w  $7 box-h  $8 text
render() {
  cat > "$OUT/$1.html" <<EOF
<html><head><meta charset="utf-8"><style>
@font-face{font-family:Tajawal;src:url('file:///$FONTDIR/$2');}
html,body{margin:0;padding:0;background:transparent;}
body{width:$6px;height:$7px;display:flex;align-items:center;justify-content:center;}
span{font-family:Tajawal;font-size:$3px;font-weight:$4;color:#fff;
     letter-spacing:$5px;direction:rtl;white-space:nowrap;}
</style></head><body><span>$8</span></body></html>
EOF

  "$CHROME" --headless=new --disable-gpu --hide-scrollbars \
    --default-background-color=00000000 --force-device-scale-factor=3 \
    --virtual-time-budget=4000 --window-size="$6,$7" \
    --screenshot="$(cygpath -w "$PWD/$OUT/$1.png" 2>/dev/null || echo "$PWD/$OUT/$1.png")" \
    "file:///$(cygpath -m "$PWD/$OUT/$1.html" 2>/dev/null || echo "$PWD/$OUT/$1.html")" \
    >/dev/null 2>&1

  echo "  $OUT/$1.png"
}

echo "rendering splash text at 3x:"
render title Tajawal-Black.ttf  27 900 0.5 300 60 "$TITLE"
render sub   Tajawal-Medium.ttf 12 500 0.3 300 40 "$SUBTITLE"
echo "now run: dart run tool/build_splash_lottie.dart"
