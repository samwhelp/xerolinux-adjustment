

################################################################################
### Head: Mod / Kde / Package / Install
##

mod_kde_package_install () {

	util_error_echo
	util_error_echo '##'
	util_error_echo '## mod_kde_package_install'
	util_error_echo '##'
	util_error_echo

	##util_error_echo "${THE_SUB_KDE_PACKAGE_LIST_INSTALL_FILE_PATH}"

	sys_package_list_install "${THE_SUB_KDE_PACKAGE_LIST_INSTALL_FILE_PATH}"

}

mod_kde_package_list_find_for_install () {
	sys_package_list_find "${THE_SUB_KDE_PACKAGE_LIST_INSTALL_FILE_PATH}"
}

##
### Tail: Mod / Kde / Package / Install
################################################################################




################################################################################
### Head: Mod / Kde / Config / Install
##

mod_kde_config_install () {

	util_error_echo
	util_error_echo '##'
	util_error_echo '## mod_kde_config_install'
	util_error_echo '##'
	util_error_echo

	util_error_echo "mkdir -p ${HOME}/.config"
	mkdir -p "${HOME}/.config"

	util_error_echo "install -Dm644 ${THE_OVERLAY_DIR_PATH}/etc/skel/.config/kglobalshortcutsrc ${HOME}/.config/kglobalshortcutsrc"
	install -Dm644 "${THE_OVERLAY_DIR_PATH}/etc/skel/.config/kglobalshortcutsrc" "${HOME}/.config/kglobalshortcutsrc"


}

##
### Tail: Mod / Kde / Config / Install
################################################################################




################################################################################
### Head: Mod / Kde / Asset / Install
##

mod_kde_asset_install () {

	util_error_echo
	util_error_echo '##'
	util_error_echo '## mod_kde_asset_install'
	util_error_echo '##'
	util_error_echo


	util_error_echo
	util_error_echo '## No Asset'
	util_error_echo

}

##
### Tail: Mod / Kde / Asset / Install
################################################################################
