#!/bin/bash

get_general() {
	sudo apt-get install git shellcheck fonts-hack-ttf sakura
	git config --global user.name "Stanislav Ch. Nikolov"
	git config --global user.email "stanislav@cukii.me"
}

get_vim() {
	sudo add-apt-repository ppa:neovim-ppa/stable
	sudo apt-get update
	sudo apt-get install neovim

	sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
	sudo update-alternatives --config vi
	sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
	sudo update-alternatives --config vim
	sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
	sudo update-alternatives --config editor

	if [ -e ~/.config/nvim ]
	then
		echo "~/.config/nvim already installed"
		echo "TODO update from ~/dotfiles"
	else
		mkdir ~/.config/nvim
		cp ~/dotfiles/init.vim ~/.config/nvim
	fi
}

get_wm() {
	#sudo apt-get install i3 polybar
	sudo apt-get install i3 rofi
	if [ -e ~/.config/i3 ]
	then
		echo "~/.config/i3 already installed"
		echo "TODO update from ~/dotfiles"
	else
		mkdir ~/.config/i3
		cp ~/dotfiles/i3/config ~/.config/i3
	fi
}

get_shell() {
	sudo apt-get install zsh
	chsh -s /bin/zsh

	if [ -e ~/.zshrc ]
	then
		echo "~/.zshrc already installed"
		echo "TODO update from ~/dotfiles"
	else
		cp ~/dotfiles/zshrc ~/.zshrc
	fi
}

fix_keyboard() {
	true;
}

get_general
get_vim
get_shell
get_wm
#fix_keyboard
