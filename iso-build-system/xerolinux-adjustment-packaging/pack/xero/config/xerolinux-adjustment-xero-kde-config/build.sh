#!/usr/bin/env bash


################################################################################
### Head: Init
##
set -e ## for Exit immediately if a command exits with a non-zero status.
THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
THE_CMD_FILE_NAME="$(basename "$0")"
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

	#return 0

	rm -f *.zst
	rm -rf pkg
	rm -rf src
	rm -rf package
	#rm -rf xero-kde-config
}

mod_package_clean_on_finish () {
	util_error_echo
	util_error_echo "## Cleaning On Finish"
	util_error_echo

	#return 0

	rm -f *.zst
	rm -rf pkg
	rm -rf src
	#rm -rf xero-kde-config
}

mod_package_make_prepare () {
	mod_package_clean
}


mod_package_make () {

	util_error_echo
	util_error_echo "## Building New Package"
	util_error_echo


	makepkg -sf
	#makepkg -sf -d

}

mod_package_make_finish () {

	mkdir -p "package"

	mv *.zst "package"

	mod_package_make_copy_to_repository

	mod_package_clean_on_finish
}

mod_package_make_copy_to_repository () {

	local repository_dir_path="../../../../../xerolinux-adjustment-repository/repo/main"

	if ! [ -d "${repository_dir_path}" ]; then
		return
	fi

	cp -a package/*.zst "${repository_dir_path}/"
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
