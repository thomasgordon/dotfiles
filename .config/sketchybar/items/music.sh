#!/bin/bash

music_anchor=(
  script="$PLUGIN_DIR/music.sh"
  click_script="open -a 'Music'"
  icon.drawing=off
  label.drawing=on
  label.font="$FONT:Semibold:13.0"
  label.color=$WHITE
  drawing=on
  width=0
  update_freq=2
)

sketchybar --add event music_poll

sketchybar --add item music.anchor center \
           --set music.anchor "${music_anchor[@]}" \
           --subscribe music.anchor music_poll
