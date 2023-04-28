#! /usr/bin/env bash

source "$HOME/.cache/wal/colors.sh"

swaylock \
    --inside-color 00000000 \
    --inside-clear-color 00000000 \
    --inside-ver-color 00000000 \
    --inside-wrong-color 00000000 \
    --key-hl-color "$color6" \
    --bs-hl-color "$color6" \
    --ring-color "$color1" \
    --ring-clear-color "$color1" \
    --ring-wrong-color "$color2" \
    --ring-ver-color "$color1" \
    --line-uses-ring \
    --line-color 00000000 \
    --font 'NotoSans Nerd Font Mono:style=Thin,Regular 42' \
    --text-color "$color6" \
    --text-clear-color "$color1" \
    --text-wrong-color "$color2" \
    --text-ver-color "$color1" \
    --separator-color 00000000
