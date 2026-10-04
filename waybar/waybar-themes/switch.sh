#!/usr/bin/env bash
# usage: ./switch.sh <theme>     (run with no args to list themes)
cd "$(dirname "$0")" || exit 1
t="$1"
if [ -z "$t" ] || [ ! -f "$t/style.css" ]; then
  echo "Themes:"; for d in */; do echo "  ${d%/}"; done; exit 1
fi
mkdir -p ~/.config/waybar
cp "$t/style.css" ~/.config/waybar/style.css
pkill -SIGUSR2 waybar && echo "Applied: $t"
