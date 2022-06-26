#! /bin/bash

is_active="$(systemctl --user is-active phoenixminer.service)"
is_enabled="$(systemctl --user is-enabled phoenixminer.service)"
intensity="$(awk '/-mi/ {print $2}' ~/.local/phoenixminer/config.txt)"

case $BUTTON in
        1)
		chromium "https://eth.nanopool.org/account/0x8f297a2eda85dcafa6f20c335cf10fdeaf881a18" &
		;;
        2)
		{
			is_enabled="$(systemctl --user is-enabled phoenixminer.service)"
			if [ "$is_enabled" = "enabled" ]; then
				systemctl --user disable phoenixminer.service
				is_enabled="disabled"
			else
				systemctl --user enable phoenixminer.service
				is_enabled="enabled"
			fi
		} > /dev/null 2>&1 &
                ;;
        3)
		{
			is_active="$(systemctl --user is-active phoenixminer.service)"
			if [ "$is_active" = "active" ]; then
				systemctl --user stop phoenixminer.service
				is_active="inactive"
			else
				systemctl --user start phoenixminer.service
				is_active="active"
			fi
		} > /dev/null 2>&1 &
                ;;
	4)
		[ "$intensity" -lt 14 ] && {
			let intensity++
			sed -i "s/-mi $(( intensity - 1 ))/-mi $intensity/" ~/.local/phoenixminer/config.txt
			[ "$is_active" = "active" ] && systemctl --user restart phoenixminer.service
		} > /dev/null 2>&1 &
		;;
	5)
		[ "$intensity" -gt 1 ] && {
			let intensity--
			sed -i "s/-mi $(( intensity + 1 ))/-mi $intensity/" ~/.local/phoenixminer/config.txt
			[ "$is_active" = "active" ] && systemctl --user restart phoenixminer.service
		} > /dev/null 2>&1 &
		;;
esac
disown -a

echo -n "$intensity"

[ "$is_enabled" = "enabled" ] && echo -n "e" || echo -n "d"

[ "$is_active" != "active" ] && echo "x" && exit

mhs="$(journalctl --user-unit=phoenixminer -n 15 2>&1 | awk -F ":" '/Eth speed/ {sub(/\..*$/, "", $5);gsub(/ /, "", $5);occ=$5} END {print occ}')"

[ -z "$mhs" ] && echo "o" || echo "$mhs" 
