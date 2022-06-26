#!/bin/dash

percent1=$(ddcutil -t -d $1 --sleep-multiplier .1 getvcp 10 | cut -c10-12)

echo "$percent1%"
