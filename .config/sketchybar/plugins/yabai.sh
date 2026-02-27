#!/bin/bash

window_state() {
  source "$HOME/.config/sketchybar/colours.sh"
  source "$HOME/.config/sketchybar/icons.sh"

  WINDOW=$(yabai -m query --windows --window)
  CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

  args=()
  if [[ $CURRENT -gt 0 ]]; then
    LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    args+=(--set $NAME icon=$YABAI_STACK icon.colour=$RED label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))
    yabai -m config active_window_border_colour $RED > /dev/null 2>&1 &

  else
    args+=(--set $NAME label.drawing=off)
    case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
      "false")
        if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_FULLSCREEN_ZOOM icon.colour=$GREEN)
          yabai -m config active_window_border_colour $GREEN > /dev/null 2>&1 &
        elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_PARENT_ZOOM icon.colour=$BLUE)
          yabai -m config active_window_border_colour $BLUE > /dev/null 2>&1 &
        else
          args+=(--set $NAME icon=$YABAI_GRID icon.colour=$ORANGE)
          yabai -m config active_window_border_colour $WHITE > /dev/null 2>&1 &
        fi
        ;;
      "true")
        args+=(--set $NAME icon=$YABAI_FLOAT icon.colour=$MAGENTA)
        yabai -m config active_window_border_colour $MAGENTA > /dev/null 2>&1 &
        ;;
    esac
  fi

  sketchybar -m "${args[@]}"
}

windows_on_spaces () {
  CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  args=()
  while read -r line
  do
    for space in $line
    do
      icon_strip=" "
      apps=$(yabai -m query --windows --space $space | jq -r ".[].app")
      if [ "$apps" != "" ]; then
        while IFS= read -r app; do
          icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
        done <<< "$apps"
      fi
      args+=(--set space.$space label="$icon_strip" label.drawing=on)
    done
  done <<< "$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  yabai -m window --toggle float
  window_state
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "forced") exit 0
  ;;
  "window_focus") window_state
  ;;
  "windows_on_spaces") windows_on_spaces
  ;;
esac
