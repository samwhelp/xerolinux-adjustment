#!/usr/bin/env bash


################################################################################
### Head: Note
##

## * https://github.com/samwhelp/skel-project-plan/blob/gh-pages/demo/sh/project/bin/install.sh

##
### Tail: Note
################################################################################


################################################################################
### Head: Init
##

THE_BASE_DIR_PATH="$(cd -- "$(dirname -- "$0")" ; pwd)"
THE_BASE_DIR_PATH="$THE_BASE_DIR_PATH/../ext"
source "$THE_BASE_DIR_PATH/init.sh"

##
### Tail: Init
################################################################################


################################################################################
### Head: Model / Db / Pkg / List
##

mod_db_pkg_list () {

	util_error_echo "sudo pacman -Sl xerolinux-adjustment"
	sudo pacman -Sl xerolinux-adjustment

}

##
### Tail: Model / Db / Sync
################################################################################


################################################################################
### Head: Main
##

__main__ () {
	mod_db_pkg_list "$@"
}

__main__ "$@"

##
### Tail: Main
################################################################################
