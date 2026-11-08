#!/bin/sh
# Draws the placeholder art (SVG) and rasterises it to assets/images/*.png
# using macOS QuickLook, so no extra tooling is needed.
set -e
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
cd "$(dirname "$0")/.."
python3 -I tool/generate_seed_assets.py
rm -f assets/images/*.png
for f in tool/seed_art/*.svg; do
  name=$(basename "$f" .svg)
  qlmanage -t -s 640 -o "$tmp" "$f" >/dev/null 2>&1
  mv "$tmp/$name.svg.png" "assets/images/$name.png"
done
echo "wrote $(ls assets/images/*.png | wc -l) PNGs to assets/images"
