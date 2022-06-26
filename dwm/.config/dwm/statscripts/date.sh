#! /bin/sh

case $BUTTON in
	1)
		alacritty -e "neomutt" &
		;;
	2)
		alacritty -e "calcurse" &
		;;
	3)
		notify-send "$(date)" &
		;;
	4)
		echo "12" > ~/.config/dwm/statscripts/dateformat
		;;
	5)
		echo "24" > ~/.config/dwm/statscripts/dateformat
		;;
esac
disown -a

case "$(cat ~/.config/dwm/statscripts/dateformat)" in
	"24")
		date "+%I:%M"
		;;
	"12")
		date "+%H:%M"
		;;
esac
