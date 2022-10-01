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
### Head: Model / Db / Update
##

mod_db_update () {

	util_error_echo

	##cd ../../repo/main
	util_error_echo "cd $THE_REPO_MAIN_DIR_PATH"
	cd "$THE_REPO_MAIN_DIR_PATH"

	#repo-add -n -R xerolinux-adjustment.db.tar.gz *.pkg.tar.zst

	repo_name="xerolinux-adjustment"

	util_error_echo "rm -f ${repo_name}.*"
	rm -f ${repo_name}.*


	util_error_echo

	util_error_echo "repo-add -n -R ${repo_name}.db.tar.gz *.pkg.tar.zst"
	repo-add -n -R ${repo_name}.db.tar.gz *.pkg.tar.zst



	util_error_echo

	util_error_echo "cd $OLDPWD"
	cd "$OLDPWD"

	util_error_echo
}

##
### Tail: Model / Db / Update
################################################################################


################################################################################
### Head: Main
##

__main__ () {
	mod_db_update "$@"
}

__main__ "$@"

##
### Tail: Main
################################################################################
