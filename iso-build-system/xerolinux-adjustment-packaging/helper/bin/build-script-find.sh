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
### Head: Model / Find Build Script
##

mod_build_script_find () {

	cd "${THE_PLAN_DIR_PATH}"

	#mod_build_script_find_v1
	mod_build_script_find_v2

}


mod_build_script_find_v1 () {

	## https://stackoverflow.com/questions/45843933/extract-directory-path-from-file-path
	find pack -type f -name build.sh | awk -F '/' '{$NF=""}1' OFS='/'

}


mod_build_script_find_v2 () {

	find pack -type f -name build.sh | awk -F '/build.sh' '{print $1}'

}

##
### Tail: Model / Find
################################################################################


################################################################################
### Head: Main
##

__main__ () {
	mod_build_script_find "$@"
}

__main__ "$@"

##
### Tail: Main
################################################################################




