#!/bin/sh
OUTPUT="$HOME/Pictures/Screenshots"
FILE="$OUTPUT/$(date -Ins).png"

/usr/bin/mkdir -p $OUTPUT
/usr/bin/wl-paste > $FILE
