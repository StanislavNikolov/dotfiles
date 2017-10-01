compton -b
setxkbmap "us+bg(bds):2+group(alt_shift_toggle)"
setxkbmap -option caps:escape

xrdb ~/.Xresources
setwallpaper

# replaced with xorg conf
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

exec i3
