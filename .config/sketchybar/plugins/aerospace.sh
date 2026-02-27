#!/bin/bash

# Remove old app and divider items by querying what exists
for ITEM in $(sketchybar --query bar | grep -oE '"aerospace\.(app|divider)\.[^"]+"' | tr -d '"'); do
  sketchybar --remove "$ITEM"
done

FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
FOCUSED_APP=$(aerospace list-windows --focused --format '%{app-name}')

INDEX=0
while read -r APP; do
  if [[ $INDEX -gt 0 ]]; then
    DIVIDER="aerospace.divider.$INDEX"
    sketchybar --add item "$DIVIDER" left \
      --set "$DIVIDER" \
        label="|" \
        label.width=8 \
        label.drawing=on \
        label.colour=0x80ffffff \
        padding_left=2 \
        padding_right=2 \
        background.drawing=off
  fi

  INDEX=$((INDEX + 1))

  ITEM="aerospace.app.$APP"
  BG_COLOUR=0x00000000
  LABEL_COLOUR=0xffffffff

  sketchybar --add item "$ITEM" left \
    --set "$ITEM" \
      label="$APP" \
      padding_left=2 \
      padding_right=2 \
      background.colour="$BG_COLOUR" \
      background.corner_radius=5 \
      background.height=20 \
      label.colour="$LABEL_COLOUR" \
      click_script="aerospace focus app \"$APP\""

done < <(aerospace list-windows --workspace "$FOCUSED_WORKSPACE" --format '%{app-name}' | sort -u)
