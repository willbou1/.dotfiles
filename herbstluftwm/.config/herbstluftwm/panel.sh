#! /bin/sh

[ "$1" = "kill" ] && killall polybar

MONITOR=$1 polybar --reload example
