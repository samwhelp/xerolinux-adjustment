#!/usr/bin/env bash

set -e


################################################################################
### Head: kde
##
kde_config_install () {

	echo "## Config: kde"
	echo

	echo "mkdir -p $HOME/.config/"
	mkdir -p "$HOME/.config/"


	echo "install -Dm644 ./config/kde/kglobalshortcutsrc $HOME/.config/kglobalshortcutsrc"
	install -Dm644 "./config/kde/kglobalshortcutsrc" "$HOME/.config/kglobalshortcutsrc"


	echo
}
##
### Tail: kde
################################################################################


################################################################################
### Head: main
##
main_config_install () {
	kde_config_install
}
## start
main_config_install

##
### Tail: main
################################################################################
