#! /bin/fish

switch $argv[1]
	case "--start"
		for i in (hyprctl monitors -j | jq '.[].id')
			hyprctl dispatch focusmonitor "$i"
			kitty --class mpv_screensaver -o font_size=13 --start-as fullscreen  mpv --stop-screensaver=no --panscan=1 --quiet --no-config --mute=yes -vo=tct ~/priv/vids/screensavers/space_fade.mp4 &
			sleep 1
		end
	case "--stop"
		for i in (hyprctl clients -j  | jq '.[] | select(.class == "mpv_screensaver") | .pid') 
			kill "$i"
		end
end
