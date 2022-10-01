#!/usr/bin/env bash

set -e


################################################################################
### Head: xerolinux
##
xerolinux_config_install () {

	echo "## Config: xerolinux"
	echo

	echo "mkdir -p $HOME/.config/"
	mkdir -p "$HOME/.config/"


	echo "install -Dm644 ./config/xerolinux/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc"
	install -Dm644 "./config/xerolinux/kglobalshortcutsrc" "$HOME/.config/kglobalshortcutsrc"


	echo
}
##
### Tail: xerolinux
################################################################################


################################################################################
### Head: main
##
main_config_install () {
	xerolinux_config_install
}
## start
main_config_install

##
### Tail: main
################################################################################
