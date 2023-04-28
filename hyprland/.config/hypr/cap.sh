#! /usr/bin/env bash

. ~/.cache/wal/colors.sh
slurp_args="-b "$background"BB -B "$background"BB -c "$color5"BB"

grim -l 1 ~/.cache/hyprland/screenfreeze
feh --title screenfreeze ~/.cache/hyprland/screenfreeze &

[[ "$1" != "monitor" ]] && dims="$(slurp $slurp_args -w 3)"
[[ "$1" == "monitor" ]] && dims="$(slurp $slurp_args -o)"

grim -g "$dims" - | wl-copy

killall feh
