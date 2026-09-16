#!/bin/bash
# Bygg installbar Calibre-plugin-zip fra src/ — terje1965s fork-vedlikehold.
#
# Hvorfor denne finnes: upstreams eneste release (0.1.0) mangler krasj-fiksen
# fra PR #1 (PDF-er uten metadata), og det kom aldri en ny release. Denne
# forkens main har fiksen; skriptet bygger zip med bumpet versjon.
#
# Bruk:  ./build.sh              → dist/pdf_cover_<versjon>.zip
#        ./build.sh --install    → bygger OG installerer via calibre-customize
set -eu
cd "$(dirname "$0")"

VER=$(python3 - <<'EOF'
import re
s = open("src/__init__.py").read()
m = re.search(r"version\s*=\s*\((\d+),\s*(\d+),\s*(\d+)\)", s)
print(".".join(m.groups()))
EOF
)
ZIP="dist/pdf_cover_${VER}.zip"
mkdir -p dist
rm -f "$ZIP"
( cd src && zip -qr "../$ZIP" . -x "*.DS_Store" )
echo "bygget: $ZIP ($(stat -f%z "$ZIP") bytes) — plugin-versjon $VER"

if [ "${1:-}" = "--install" ]; then
    /Applications/calibre.app/Contents/MacOS/calibre-customize -a "$ZIP"
    /Applications/calibre.app/Contents/MacOS/calibre-customize -l | grep -i "pdf cover"
fi
