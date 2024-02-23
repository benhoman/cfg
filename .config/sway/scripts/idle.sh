#!/usr/bin/env bash
swayidle -w \
	timeout 300 '~/.config/sway/scripts/lock.sh' \
	timeout 500 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' \
	before-sleep '~/.config/sway/scripts/lock.sh'
