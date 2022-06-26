#! /bin/bash

case $BUTTON in
        1)
		alacritty -t "ncpamixer" -e "ncpamixer" &
                ;;
        2)
		catia &
                ;;
        3)
		{
			new_status="$(amixer -D pulse sget Master | awk '/%]/ {gsub(/\[|\]/, "", $0); print ($6 == "on") ? "off" : "on"; exit}')"
                        amixer -D pulse sset Master "$new_status"
                } > /dev/null 2>&1
                ;;
	4)
		{
			amixer -D pulse sset Master 5%+
			amixer -D pulse sset Master on
		} > /dev/null 2>&1
		;;
	5)
		amixer -D pulse sset Master 5%- > /dev/null 2>&1
		;;
esac
disown -a

amixer -D pulse sget Master | awk '/Front Left:/ {gsub("\\[|\\]|%", "", $0);printf "%1.2f",$5 / 100; if($6 == "on") {printf ">"} else if ($6 == "off") {printf "x"}}'

pactl info | awk '/Default Sink:/ {sub(/_.*/,"", $3);print substr($3, 1, 1)}'
