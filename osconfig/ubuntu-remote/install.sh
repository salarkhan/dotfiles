install_apt() {
	declare -a bins=(
		"xclip"
		"curl"
		"ripgrep"
		"helix"
	)

	# add relevant PPAs
	sudo add-apt-repository ppa:maveonair/helix-editor

	# update before we let er rip
	sudo apt update

	for b in "${bins[@]}"
	do
		sudo apt-get install -y $b
	done
}

install_apt
