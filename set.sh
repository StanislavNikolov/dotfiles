#!/bin/bash

sudo apt update
sudo apt install zsh git neovim i3

git config --global user.name "Stanislav Ch. Nikolov"
git config --global user.email "stanislav.ltb@gmail.com"

ln -s $(pwd)/zshrc ~/.zshrc

mkdir -p ~/.config/nvim
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim

mkdir -p ~/.config/alacritty
#ln -s $(pwd)/alacritty_dark.yml ~/.config/alacritty/alacritty.yml
# sadly, alacritty fails to live reload symlinked files
cp $(pwd)/alacritty_dark.yml ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/i3
ln -s $(pwd)/i3_config ~/.config/i3/config

ln -s $(pwd)/autorun ~/.autorun
ln -s $(pwd)/Xresources ~/.Xresources
