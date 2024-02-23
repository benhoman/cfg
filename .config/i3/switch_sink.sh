#!/usr/bin/env bash

# all_sinks=$(pactl list short sinks | cut -f 2)
all_sinks=$(pactl -f json list sinks | jq -r '.[].description')

default_sink=$(pactl info | grep 'Default Sink' | cut -d : -f 2)

active_sink=$(echo "$all_sinks" | grep -n $default_sink | cut -d : -f 1)

selected_sink=$(echo "$all_sinks" | rofi -theme tokyonight -dmenu -i -a $(($active_sink - 1)) -p 'Select a device: ')
selected_sink_name=$(pactl -f json list sinks | jq --arg sink "$selected_sink" -c '.[] | select(.description==$sink ) | .name')

# echo "$selected_sink => $selected_sink_name"
pactl set-default-sink $selected_sink
