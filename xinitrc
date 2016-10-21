#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
#

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
xrdb ~/.Xresources

sxhkd -t 1 &

setwallpaper
setxkbmap -option caps:escape
setxkbmap "us+bg(bds):2+group(alt_shift_toggle)"
kbdd

startBar &
compton -f -m 0.9 -o 0.06 -d 5 --blur-kern "3,3,0.0,1.0,0.0,1.0,-4.0,1.0,0,1.0" -c &

bspwm

#./windowchef/windowchef
#i3
#if [[ "$1" == "" ]]
#then
#	i3
#else
#	exec "$1"
#fi
