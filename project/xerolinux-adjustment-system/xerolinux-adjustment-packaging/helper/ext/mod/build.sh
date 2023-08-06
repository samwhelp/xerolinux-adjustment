

################################################################################
### Head: Model / Find Build Script
##

sys_build_script_find () {

	cd "${THE_PLAN_DIR_PATH}"

	#sys_build_script_find_v1
	sys_build_script_find_v2

}


sys_build_script_find_v1 () {

	## https://stackoverflow.com/questions/45843933/extract-directory-path-from-file-path
	find pack -type f -name build.sh | awk -F '/' '{$NF=""}1' OFS='/'

}


sys_build_script_find_v2 () {

	find pack -type f -name build.sh | awk -F '/build.sh' '{print $1}'

}

##
### Tail: Model / Find Build Script
################################################################################
