#!/bin/env bash

cp ~/.config/nvim/init.vim ./init.vim
cp ~/.config/zsh/zshrc ./zshrc
cp ~/.xinitrc ./xinitrc

diff --brief -Nr ./hax ~/.hax > /dev/null \
	|| (git rm -r ./hax; rm -rf ./hax; cp -r ~/.hax ./hax; git add ./hax)

diff --brief -Nr ./i3 ~/.config/i3 > /dev/null \
	|| (git rm -r ./i3; rm -rf ./i3; cp -r ~/.config/i3 ./i3; git add ./i3)

diff --brief -Nr ./bspwm ~/.config/bspwm > /dev/null \
	|| (git rm -r ./bspwm; rm -rf ./bspwm; cp -r ~/.config/bspwm ./bspwm; git add ./bspwm)

diff --brief -Nr ./sxhkd ~/.config/sxhkd > /dev/null \
	|| (git rm -r ./sxhkd; rm -rf ./sxhkd; cp -r ~/.config/sxhkd ./sxhkd; git add ./sxhkd)
