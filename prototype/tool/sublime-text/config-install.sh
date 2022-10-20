#!/usr/bin/env bash

set -e


################################################################################
### Head: sublime-text
##
sublime_text_config_install () {

	echo
	echo "##"
	echo "## Config: sublime-text"
	echo "##"
	echo

	echo "mkdir -p $HOME/.config/sublime-text/Packages/User"
	mkdir -p "$HOME/.config/sublime-text/Packages/User"


	echo "install -Dm644 ./config/sublime-text/Packages/User/Preferences.sublime-settings $HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings"
	install -Dm644 "./config/sublime-text/Packages/User/Preferences.sublime-settings" "$HOME/.config/sublime-text/Packages/User/Preferences.sublime-settings"


	echo
}

##
### Tail: sublime-text
################################################################################


################################################################################
### Head: main
##
main_config_install () {
	sublime_text_config_install
}
## start
main_config_install

##
### Tail: main
################################################################################
