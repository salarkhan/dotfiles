#!/bin/bash

install_snap() {
	declare -a snaps=(
		"slack"
		"zoom-client"
		"spotify"
	)

	for s in "${snaps[@]}"
	do
		sudo snap install $s
	done
}

install_apt() {
	declare -a bins=(
		"xclip"
		"asdf"
		"curl"
		"jq"
		"ripgrep"
		"k8s"
		"helix"
		"g++"
	)

	for b in "${bins[@]}"
	do
		sudo apt-get install $b
	done
}

install_misc() {
	# python
	sudo apt-get install python3.12-venv
	python3 -m venv ~/.venv

	# golang
	asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
	asdf install golang latest
	asdf global golang latest
	go install golang.org/x/tools/gopls@latest

	# node
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf install nodejs latest
	asdf global nodejs latest

	# kitty
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	# Place the kitty.desktop file somewhere it can be found by the OS
	cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
	# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
	cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
	# Update the paths to the kitty and its icon in the kitty desktop file(s)
	sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
	sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
	# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
	echo 'kitty.desktop' > ~/.config/xdg-terminals.list
}

install_snap
install_apt
install_misc
