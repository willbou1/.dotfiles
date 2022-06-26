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
			new_status="$(amixer -D pulse sget Capture | awk '/%]/ {gsub(/\[|\]/, "", $0); if ($5 == "on") {printf "nocap"} else {printf "cap"}}')"
			amixer -D pulse sset Capture "$new_status"
		} > /dev/null 2>&1
                ;;
	4)
		{
			amixer -D pulse sset Capture 5%+
			amixer -D pulse sset Capture cap
		} > /dev/null 2>&1
		;;
	5)
		amixer -D pulse sset Capture 5%- > /dev/null 2>&1
		;;
esac
disown -a

pactl info | awk '/Default Source:/ {sub(/_.*/,"", $3);printf substr($3, 1, 1)}'
amixer -D pulse sget Capture | awk '/%]/ {gsub(/\[|\]|%/, "", $0); if ($5 == "on") {printf ">"} else {printf "x"} printf "%.2f\n", $5 / 100}'
