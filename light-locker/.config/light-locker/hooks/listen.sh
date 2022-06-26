#! /bin/bash

interface="org.freedesktop.ScreenSaver"
dpath="/org/freedesktop/ScreenSaver"
member="ActiveChanged"

dbus-monitor --session "type='signal',interface='$interface',path='$dpath',member='$member'" |
while read -r line; do
	if echo "$line" | grep "$interface" &> /dev/null; then
		read  -r state
		if echo "$state" | grep "boolean true" &> /dev/null; then
			~/.config/light-locker/hooks/on.sh
		else
			~/.config/light-locker/hooks/off.sh
		fi
	fi
done
