#! /bin/sh

ps aux | grep -v grep | grep -i picom
[ $? -eq 1 ] && picom --experimental-backend --config ~/.config/picom/picom.conf.old &
ps aux | grep -v grep | grep -i xwinwrap
[ $? -eq 1 ] && ~/.config/xwinwrap/repeat.sh ~/priv/vids/views/norway "-10" &

ps aux | grep -v grep | grep -i dwmblocks
[ $? -eq 1 ] && dwmblocks &
ps aux | grep -v grep | grep -i calcurse
[ $? -eq 1 ] && calcurse --daemon

pkill dunst
dunst -conf ~/.config/dunst/dunstrc_dwm

# XDG AUTOSTART
sleep 4
dex -a &
