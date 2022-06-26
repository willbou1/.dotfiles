#! /bin/bash

# Restore image settings
gamma="$(cat ~/.config/dwm/statscripts/gamma)"
brightness="$(awk '{if($1 > 1.0) {print "1.0"} else if ($1 < 0.2) {print "0.2"} else {print $1} exit}' ~/.config/dwm/statscripts/brightness)"
xrandr $(xrandr --listmonitors  | awk -v bri="$brightness" -v gam="$gamma" '!(/Monitors/) {printf "--output %s --gamma %s --brightness %f ", $NF, gam, bri}')
