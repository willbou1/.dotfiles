#! /bin/bash

case $BUTTON in
        1)
		dunstify "Upgrades" "$(checkupdates | cut -d " " -f 1)" &
		;;
        2)
                ;;
        3)
                ;;
	4)
		;;
	5)
		;;
esac

disown -a

cat nbupdates

checkupdates | wc -l > nbupdates &
disown -a
