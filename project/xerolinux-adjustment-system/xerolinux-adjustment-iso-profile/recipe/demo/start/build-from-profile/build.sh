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

	mod_iso_clean_on_exit
	exit 0
}

exit_on_signal_terminated () {

	util_error_echo
	util_error_echo "## Script terminated."
	util_error_echo

	mod_iso_clean_on_exit
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
### Head: Model / Build ISO
##

mod_iso_profile_prepare () {

	util_error_echo "mkdir -p ./tmp"
	mkdir -p ./tmp

}

mod_iso_clean_on_prepare () {
	util_error_echo
	util_error_echo "## Cleaning Data On Prepare"
	util_error_echo


	util_error_echo "sudo rm -rf ./tmp/out"
	sudo rm -rf "./tmp/out"

}

mod_iso_clean_on_exit () {
	util_error_echo
	util_error_echo "## Cleaning Data On Exit"
	util_error_echo

	#rm -rf "./tmp/work"
	util_error_echo "sudo rm -rf ./tmp/out"
	sudo rm -rf "./tmp/out"

}

mod_iso_clean_on_finish () {
	util_error_echo
	util_error_echo "## Cleaning Data On Finish"
	util_error_echo

	#rm -rf "./tmp/work"
	#rm -rf "./tmp/out"
}

mod_iso_make_prepare () {
	mod_iso_clean_on_prepare
	mod_iso_profile_prepare
}


mod_iso_make () {

	util_error_echo
	util_error_echo "## Building New ISO"
	util_error_echo

	#sudo mkarchiso -v profile
	sudo mkarchiso -w tmp/work -o tmp/out -v profile


}

mod_iso_make_finish () {

	mod_iso_make_copy_to_store

	mod_iso_clean_on_finish

}

mod_iso_make_copy_to_store () {

	local iso_store_dir_path="../../../../iso/"

	if ! [ -d "${iso_store_dir_path}" ]; then
		return
	fi

	cp -a out/*.iso "${iso_store_dir_path}/"
}

mod_iso_build () {
	mod_iso_make_prepare
	mod_iso_make
	mod_iso_make_finish
}

##
### Tail: Model / Build ISO
################################################################################


################################################################################
### Head: Main
##
__main__ () {

	mod_signal_bind
	mod_iso_build

}

__main__
##
### Tail: Main
################################################################################




