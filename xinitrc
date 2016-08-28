
#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
xrdb ~/.Xresources

setwallpaper
setxkbmap -option caps:escape
setxkbmap "us+bg(bds):2+group(alt_shift_toggle)"
kbdd

DEFAULT_SESSION=i3
case $1 in
  xfce) exec dbus-launch xfce4-session ;;
  *) exec $DEFAULT_SESSION ;;
esac
