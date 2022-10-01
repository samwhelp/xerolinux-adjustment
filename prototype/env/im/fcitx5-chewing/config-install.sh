#!/usr/bin/env bash

set -e


################################################################################
### Head: fcitx5
##
fcitx5_config_install () {

	echo
	echo "mkdir -p $HOME/.config/fcitx5/conf"
	mkdir -p "$HOME/.config/fcitx5/conf"


	echo
	echo "install -Dm644 ./config/fcitx5/profile $HOME/.config/fcitx5/profile"
	install -Dm644 ./config/fcitx5/profile "$HOME/.config/fcitx5/profile"

	echo
	echo "install -Dm644 ./config/fcitx5/config $HOME/.config/fcitx5/config"
	install -Dm644 ./config/fcitx5/config "$HOME/.config/fcitx5/config"




	echo
	echo "install -Dm644 ./config/fcitx5/conf/classicui.conf $HOME/.config/fcitx5/conf/classicui.conf"
	install -Dm644 ./config/fcitx5/conf/classicui.conf "$HOME/.config/fcitx5/conf/classicui.conf"


	echo
	echo "install -Dm644 ./config/fcitx5/conf/chewing.conf $HOME/.config/fcitx5/conf/chewing.conf"
	install -Dm644 ./config/fcitx5/conf/chewing.conf "$HOME/.config/fcitx5/conf/chewing.conf"




	echo
	fcitx5_config_install_im_config
	echo

}

fcitx5_config_install_im_config () {
	#fcitx5_config_install_im_config_by_command
	fcitx5_config_install_im_config_by_pam_environment
}

fcitx5_config_install_im_config_by_command () {
	echo

	echo "im-config -n fcitx5"
	im-config -n fcitx5

	echo "cat ~/.xinputrc"
	cat ~/.xinputrc

	echo
}

fcitx5_config_install_im_config_by_pam_environment () {

	echo
	echo "install -m 644 ./config/fcitx5/.pam_environment $HOME/.pam_environment"
	install -m 644 ./config/fcitx5/.pam_environment $HOME/.pam_environment

}

##
### Tail: fcitx5
################################################################################


################################################################################
### Head: main
##
main_config_install () {
	fcitx5_config_install
}
## start
main_config_install

##
### Tail: main
################################################################################
