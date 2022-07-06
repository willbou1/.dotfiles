#!/usr/bin/env bash

wd="$HOME/priv/pics/wallpapers/"
cd "$wd"

if [ "$ROFI_RETV" = "0" ]; then
	echo -en "\0no-custom\x1ftrue\n"
	for f in $(ls -1 *.{png,jpg}); do
		sf="${f%.*}"
		echo -en "$sf\0icon\x1f$wd$f\x1finfo\x1f$f\n"
	done
else
	echo "$wd$ROFI_INFO" > $wd/curr
	herbstclient reload
	exit 0
fi
