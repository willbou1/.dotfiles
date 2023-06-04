#! /bin/bash

. ~/.cache/wal/colors.sh

pacwall
pkill dunst
pywalfox update
pgrep -x "eww" && ~/.config/eww/launch

hyprctl keyword general:col.active_border "0x88${color5:1}"
hyprctl keyword general:col.inactive_border "0x88${color1:1}"
