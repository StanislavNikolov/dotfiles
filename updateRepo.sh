#!/bin/env bash

cp ~/.config/nvim/init.vim ./init.vim
cp ~/.config/zsh/zshrc ./zshrc
cp ~/.xinitrc ./xinitrc
cp ~/.config/alacritty/alacritty.yml ./alacritty.yml

diff --brief -Nr ./hax ~/.hax > /dev/null || (rm -rf ./hax; cp -r ~/.hax ./hax)
diff --brief -Nr ./i3 ~/config/i3 > /dev/null || (rm -rf ./i3; cp -r ~/.config/i3 ./i3)
