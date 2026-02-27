#!/bin/bash

FOCUSED=$(aerospace list-workspaces --focused)
sketchybar --set aerospace.workspace icon="$FOCUSED"

# Hide all slots first
sketchybar --set aerospace.app.1 drawing=off
sketchybar --set aerospace.app.2 drawing=off
sketchybar --set aerospace.app.3 drawing=off
sketchybar --set aerospace.divider.1 drawing=off
sketchybar --set aerospace.divider.2 drawing=off

# Read apps into array
APPS=()
while read -r APP; do
  APPS+=("$APP")
done < <(aerospace list-windows --workspace "$FOCUSED" --format '%{app-name}' | sort -u)

COUNT=${#APPS[@]}

# Update and show slots based on app count
for i in "${!APPS[@]}"; do
  SLOT=$((i + 1))
  APP="${APPS[$i]}"
  ICON=$("$HOME/.config/sketchybar/plugins/icon_map.sh" "$APP")

  sketchybar --set aerospace.app.$SLOT \
    icon="$ICON" \
    drawing=on \
    click_script="aerospace focus --app-name '$APP'"

  # Show divider before this slot if not the first
  if [[ $i -gt 0 ]]; then
    sketchybar --set aerospace.divider.$i drawing=on
  fi
done
