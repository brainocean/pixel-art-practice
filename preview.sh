#!/usr/bin/env bash
# Usage: ./preview.sh <file.aseprite> [scale]
# Exports a scaled PNG next to the source file for review.
# Default scale: 8

set -euo pipefail

ASE=/Applications/Aseprite.app/Contents/MacOS/aseprite

if [[ $# -lt 1 ]]; then
  echo "usage: $0 <file.aseprite> [scale]" >&2
  exit 1
fi

src="$1"
scale="${2:-8}"

if [[ ! -f "$src" ]]; then
  echo "error: file not found: $src" >&2
  exit 1
fi

dir=$(dirname "$src")
base=$(basename "$src" .aseprite)
out="${dir}/${base}-preview.png"

"$ASE" -b "$src" --scale "$scale" --save-as "$out"
echo "$out"
