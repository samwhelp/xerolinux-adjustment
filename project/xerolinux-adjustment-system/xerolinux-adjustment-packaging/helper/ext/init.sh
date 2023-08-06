

################################################################################
### Head: Base / Init
##

## * https://github.com/samwhelp/skel-project-plan

## set -e ##

#echo $THE_BASE_DIR_PATH
source "$THE_BASE_DIR_PATH/base.sh"

base_var_init

base_var_dump



##
### Tail: Base / Init
################################################################################


################################################################################
### Head: Func / Init
##

##
## util function
##
source "$THE_EXT_DIR_PATH/util.sh"


##
## mod function
##
source "$THE_EXT_DIR_PATH/mod/build.sh"

##
### Tail: Func / Init
################################################################################
