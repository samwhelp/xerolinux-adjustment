

################################################################################
### Head: Mod / Pacman / Package / Install
##

mod_pacman_package_install () {

	util_error_echo
	util_error_echo '##'
	util_error_echo '## mod_pacman_package_install'
	util_error_echo '##'
	util_error_echo

	##util_error_echo "${THE_SUB_PACMAN_PACKAGE_LIST_INSTALL_FILE_PATH}"

	sys_package_list_install "${THE_SUB_PACMAN_PACKAGE_LIST_INSTALL_FILE_PATH}"

}

mod_pacman_package_list_find_for_install () {
	sys_package_list_find "${THE_SUB_PACMAN_PACKAGE_LIST_INSTALL_FILE_PATH}"
}

##
### Tail: Mod / Pacman / Package / Install
################################################################################




################################################################################
### Head: Mod / Pacman / Config / Install
##

mod_pacman_config_install () {

	util_error_echo
	util_error_echo '##'
	util_error_echo '## mod_pacman_config_install'
	util_error_echo '##'
	util_error_echo

	##
	## pacman.conf
	##

	util_error_echo "sudo install -Dm644 ${THE_OVERLAY_DIR_PATH}/etc/pacman.conf /etc/pacman.conf"
	sudo install -Dm644 "${THE_OVERLAY_DIR_PATH}/etc/pacman.conf" "/etc/pacman.conf"


}

##
### Tail: Mod / Pacman / Config / Install
################################################################################




################################################################################
### Head: Mod / Pacman / Asset / Install
##

mod_pacman_asset_install () {

	util_error_echo
	util_error_echo '##'
	util_error_echo '## mod_pacman_asset_install'
	util_error_echo '##'
	util_error_echo


	util_error_echo
	util_error_echo '## No Asset'
	util_error_echo

}

##
### Tail: Mod / Pacman / Asset / Install
################################################################################
