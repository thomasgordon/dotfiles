#!/bin/bash

sketchybar --add event aerospace_workspace_change

workspace=(
  icon.font="$FONT:Bold:14.0"
  icon.padding_left=10
  icon.padding_right=10
  padding_left=2
  padding_right=2
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
  background.corner_radius=9
  background.height=30
  background.drawing=on
  label.drawing=off
  script="$PLUGIN_DIR/aerospace_workspace.sh"
)

sketchybar --add item aerospace.workspace left \
           --set aerospace.workspace "${workspace[@]}" \
           --subscribe aerospace.workspace aerospace_workspace_change

separator=(
  icon=􀆊
  icon.font="$FONT:Heavy:16.0"
  padding_left=15
  padding_right=15
  label.drawing=off
  icon.color=$WHITE
)

sketchybar --add item separator left \
           --set separator "${separator[@]}"

for i in 1 2 3; do
  sketchybar --add item aerospace.app.$i left \
             --set aerospace.app.$i \
               icon.font="sketchybar-app-font:Regular:16.0" \
               icon.color=$WHITE \
               icon.width=20 \
               label.drawing=off \
               padding_left=4 \
               padding_right=4 \
               background.drawing=off \
               drawing=off
done

for i in 1 2; do
  sketchybar --add item aerospace.divider.$i left \
             --set aerospace.divider.$i \
               label="|" \
               label.width=8 \
               label.align=center \
               label.drawing=on \
               label.font="$FONT:Bold:14.0" \
               label.color=$WHITE \
               padding_left=2 \
               padding_right=2 \
               background.drawing=off \
               drawing=off
done
