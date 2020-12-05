#!/bin/bash

dotfiles="$HOME/dotfiles"

rm ~/.config/alacritty/alacritty.yml

if [ $(cat ~/.stjo_theme) = "dark" ]; then
	# currently in dark mode
	echo "light" > ~/.stjo_theme
	cp "$dotfiles/alacritty_light.yml" ~/.config/alacritty/alacritty.yml
else
	echo "dark" > ~/.stjo_theme
	cp "$dotfiles/alacritty_dark.yml" ~/.config/alacritty/alacritty.yml
fi

for dir in $(find /tmp -maxdepth 1 -user stjo -name 'nvim*'); do
	nvr --servername "$dir/0" --remote-send ':so ~/.config/nvim/init.vim<cr>'
done
