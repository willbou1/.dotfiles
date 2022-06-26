location="$(expressvpn ls all | awk '(NR == 2) {iLoc = index($0, $3); lenLoc = length($3)} (NR > 2) {f3 = substr($0, iLoc, lenLoc); sub(/ *$/, "", f3); print(f3)}' | rofi -dmenu -i)"

if [ -n "$location" ]; then
	expressvpn disconnect
	sleep 3
	expressvpn connect "$location"
fi
