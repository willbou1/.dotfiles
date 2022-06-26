#! /bin/bash

status="$(expressvpn status)"

if [[ "$status" == *"Not connected"* ]]; then
	echo "x"
elif [[ "$status" == *"Connecting"* ]]; then
	echo "c"
else
	echo "$status" | awk '/Connected to / {sub(/.*Connected to /, "", $0); split($0,a," - "); if(length(a) == 2) {print substr(a[1],1,3) "-" substr(a[2],1,3)} else {print substr($0,1,7)}}'
fi
