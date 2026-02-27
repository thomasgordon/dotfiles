#!/bin/bash

update() {
  PLAYING=1
  IS_RUNNING=$(osascript -e 'application "Music" is running' 2>/dev/null)

  if [ "$IS_RUNNING" = "true" ]; then
    STATE=$(osascript -e 'tell application "Music" to get player state' 2>/dev/null)
    if [ "$STATE" = "playing" ]; then
      PLAYING=0
      TRACK=$(osascript -e 'tell application "Music" to get name of current track' | sed 's/\(.\{25\}\).*/\1.../')
      ARTIST=$(osascript -e 'tell application "Music" to get artist of current track' | sed 's/\(.\{20\}\).*/\1.../')
    fi
  fi

  if [ $PLAYING -eq 0 ]; then
    sketchybar --set music.anchor label="􀑪  $TRACK · $ARTIST" width=-1
  else
    sketchybar --set music.anchor label="" width=0
  fi
}

case "$SENDER" in
  *) update ;;
esac
