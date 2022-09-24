#!/usr/bin/env bash


################################################################################
### Head: Init
##
set -e ## for Exit immediately if a command exits with a non-zero status.
THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
THE_CMD_FILE_NAME="$(basename "$0")"

THE_TMP_DIR_PATH="${THE_BASE_DIR_PATH}/tmp"
THE_BUD_DIR_PATH="${THE_TMP_DIR_PATH}/sublime-text-4"
THE_REPO_DIR_PATH="${THE_BASE_DIR_PATH}/../../../../../xerolinux-adjustment-repository/repo/main"
THE_PACK_DIR_PATH="${THE_BASE_DIR_PATH}/package"

##
### Tail: Init
################################################################################


################################################################################
### Head: Util / Debug
##

util_error_echo () {
	echo "$@" 1>&2
}

##
### Head: Util / Debug
################################################################################


################################################################################
### Head: Signal
##
exit_on_signal_interrupted () {

	util_error_echo
	util_error_echo "## Script interrupted."
	util_error_echo

	mod_package_clean
	exit 0
}

exit_on_signal_terminated () {

	util_error_echo
	util_error_echo "## Script terminated."
	util_error_echo

	mod_package_clean
	exit 0
}

mod_signal_bind () {
	trap exit_on_signal_interrupted SIGINT
	trap exit_on_signal_terminated SIGTERM
}

##
### Tail: Signal
################################################################################


################################################################################
### Head: Model / Build Package
##
mod_package_clean () {
	util_error_echo
	util_error_echo "## Cleaning Old Package"
	util_error_echo

	rm -rf "${THE_PACK_DIR_PATH}"
	rm -rf "${THE_TMP_DIR_PATH}"
}

mod_package_clean_on_finish () {
	util_error_echo
	util_error_echo "## Cleaning On Finish"
	util_error_echo


}

mod_aur_download () {
	mkdir -p "${THE_TMP_DIR_PATH}"
	
	cd "${THE_TMP_DIR_PATH}"
	
	wget -c 'https://aur.archlinux.org/cgit/aur.git/snapshot/sublime-text-4.tar.gz'

	tar xf sublime-text-4.tar.gz

	cd "${OLDPWD}"

}

mod_package_make_prepare () {
	mod_package_clean
	mod_aur_download
}


mod_package_make () {

	util_error_echo
	util_error_echo "## Building New Package"
	util_error_echo

	cd "${THE_BUD_DIR_PATH}"

	makepkg -sf
	#makepkg -sf -d


	cd "${OLDPWD}"

}

mod_package_make_finish () {

	mkdir -p "${THE_PACK_DIR_PATH}"

	mv "${THE_BUD_DIR_PATH}/"*.zst "${THE_PACK_DIR_PATH}/"

	mod_package_make_copy_to_repository

	mod_package_clean_on_finish
}

mod_package_make_copy_to_repository () {

	if ! [ -d "${THE_REPO_DIR_PATH}" ]; then
		return
	fi

	cp -a "${THE_PACK_DIR_PATH}/"*.zst "${THE_REPO_DIR_PATH}/"
}

mod_package_build () {
	mod_package_make_prepare
	mod_package_make
	mod_package_make_finish
}

##
### Tail: Model / Build Package
################################################################################


################################################################################
### Head: Main
##
__main__ () {

	mod_signal_bind
	mod_package_build

}

__main__
##
### Tail: Main
################################################################################
