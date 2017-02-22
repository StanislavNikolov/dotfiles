#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#
#

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
xrdb ~/.Xresources

#sxhkd -t 1 &

setwallpaper

#compton --config ~/.config/compton/compton &

i3

# replaced with .xorg.conf
#setxkbmap -option caps:escape
#setxkbmap "us+bg(bds):2+group(alt_shift_toggle)"
#Section "InputClass"
	#Identifier "system-keyboard"
	#MatchIsKeyboard "on"
	#Driver "libinput"
	#Option "AutoRepeat" "200 45"
	#Option "XkbLayout" "us,bg(bds)"
	#Option "XkbOptions" "grp:alt_shift_toggle,caps:escape"
	#Option "XkbOptions" "caps:escape"
#EndSection

#if [[ "$1" == "" ]]
#then
#	i3
#else
#	exec "$1"
#fi
