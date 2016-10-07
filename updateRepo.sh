#!/bin/env bash

cp ~/.config/nvim/init.vim ./init.vim
cp ~/.config/zsh/zshrc ./zshrc
cp ~/.xinitrc ./xinitrc

diff ./hax ~/.hax -q > /dev/null || (git rm -r ./hax && cp -r ~/.hax ./hax && git add ./hax)
diff ./i3 ~/.config/i3 -q > /dev/null || (git rm -r ./i3 && cp -r ~/.config/i3 ./i3 && git add ./i3)
