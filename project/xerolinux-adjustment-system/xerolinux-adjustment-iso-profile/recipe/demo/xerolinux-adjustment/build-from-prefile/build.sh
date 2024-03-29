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
	util_error_echo "##"
	util_error_echo "## Script interrupted."
	util_error_echo "##"
	util_error_echo

	mod_iso_clean_on_exit
	exit 0
}

exit_on_signal_terminated () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Script terminated."
	util_error_echo "##"
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

	#cp -r /usr/share/archiso/configs/releng ./profile


	util_error_echo "mkdir -p ./tmp"
	mkdir -p ./tmp


	## by zip
	#mod_iso_profile_prepare_by_zip

	## by git
	mod_iso_profile_prepare_by_git



	util_error_echo

	
	mod_iso_profile_overlay

	util_error_echo "mkdir -p ./tmp"
	mkdir -p ./tmp

}

mod_iso_profile_prepare_by_zip () {

	if [ -d "./tmp/xero_iso-main/XeroKDE" ]; then
		util_error_echo "cp -rf ./tmp/xero_iso-main/XeroKDE ./profile"
		cp -rf ./tmp/xero_iso-main/XeroKDE ./profile
		return
	fi

	wget -c 'https://github.com/xerolinux/xero_iso/archive/refs/heads/main.zip' -O tmp/xero_iso.zip


	cd tmp

	unzip xero_iso.zip

	cd "${OLDPWD}"



	util_error_echo "cp -rf ./tmp/xero_iso-main/XeroKDE ./profile"
	cp -rf ./tmp/xero_iso-main/XeroKDE ./profile

}

mod_iso_profile_prepare_by_git () {


	if [ -d "./tmp/xero_iso/XeroKDE" ]; then
		util_error_echo "cp -rf ./tmp/xero_iso/XeroKDE ./profile"
		cp -rf ./tmp/xero_iso/XeroKDE ./profile
		return
	fi


	## by git
	util_error_echo "git clone https://github.com/xerolinux/xero_iso.git ./tmp/xero_iso"
	if ! git clone https://github.com/xerolinux/xero_iso.git ./tmp/xero_iso; then
		util_error_echo 'xero_iso exits'
	fi

	util_error_echo "cp -rf ./tmp/xero_iso/XeroKDE ./profile"
	cp -rf ./tmp/xero_iso/XeroKDE ./profile


}


mod_iso_clean_on_prepare () {
	util_error_echo
	util_error_echo "##"
	util_error_echo "## Cleaning Data On Prepare"
	util_error_echo "##"
	util_error_echo


	util_error_echo "rm -rf ./profile"
	rm -rf "./profile"

	util_error_echo "rm -rf ./tmp/out"
	rm -rf "./tmp/out"

	util_error_echo "sudo rm -rf ./tmp/work"
	sudo rm -rf "./tmp/work"

}

mod_iso_clean_on_exit () {
	util_error_echo
	util_error_echo "##"
	util_error_echo "## Cleaning Data On Exit"
	util_error_echo "##"
	util_error_echo

	util_error_echo "rm -rf ./tmp/out"
	rm -rf "./tmp/out"

}

mod_iso_clean_on_finish () {
	util_error_echo
	util_error_echo "##"
	util_error_echo "## Cleaning Data On Finish"
	util_error_echo "##"
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
	util_error_echo "##"
	util_error_echo "## Building New ISO"
	util_error_echo "##"
	util_error_echo

	##sudo mkarchiso -v profile
	sudo mkarchiso -w tmp/work -o tmp/out -v profile


}

mod_iso_make_finish () {

	mod_iso_make_change_owner

	mod_iso_make_copy_to_store

	mod_iso_clean_on_finish

}

mod_iso_make_change_owner () {

	util_error_echo "sudo chown $(id -u):$(id -u) tmp/out -R"
	sudo chown $(id -u):$(id -u) tmp/out -R

	#sudo chown $(id -un):$(id -un) tmp/out -R

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
### Head: Model / Build ISO / Overlay Profile
##

mod_iso_profile_overlay () {

	util_error_echo
	util_error_echo "##"
	util_error_echo "## Overlay Config"
	util_error_echo "##"
	util_error_echo


	mod_iso_profile_overlay_by_dir
	mod_iso_profile_overlay_pacman_conf
	mod_iso_profile_overlay_packages_x86_64
	mod_iso_profile_overlay_locale
	mod_iso_profile_overlay_bashrc
	mod_iso_profile_overlay_sddm_conf
}


mod_iso_profile_overlay_by_dir () {

	util_error_echo

	util_error_echo "cp -rf ./asset/overlay/etc/. ./profile/airootfs/etc"
	cp -rf ./asset/overlay/etc/. ./profile/airootfs/etc

	util_error_echo
}


mod_iso_profile_overlay_pacman_conf () {

	util_error_echo

	#util_error_echo "install -Dm644 ./asset/overlay/etc/pacman.conf ./profile/airootfs/etc/pacman.conf"
	#install -Dm644 ./asset/overlay/etc/pacman.conf ./profile/airootfs/etc/pacman.conf

	util_error_echo "cat ./asset/overlay/etc/pacman.conf.part.txt >> ./profile/airootfs/etc/pacman.conf"
	cat ./asset/overlay/etc/pacman.conf.part.txt >> ./profile/airootfs/etc/pacman.conf



	#util_error_echo "install -Dm644 ./asset/overlay-build/pacman.conf ./profile/pacman.conf"
	#install -Dm644 ./asset/overlay-build/pacman.conf ./profile/pacman.conf


	util_error_echo "cat ./asset/overlay-build/pacman.conf.part.txt >> ./profile/pacman.conf"
	cat ./asset/overlay-build/pacman.conf.part.txt >> ./profile/pacman.conf



	util_error_echo

}

mod_iso_profile_overlay_packages_x86_64 () {

	util_error_echo

	util_error_echo "sed -i 's/xero-kde-config/#xero-kde-config/g' ./profile/packages.x86_64"
	sed -i 's/xero-kde-config/#xero-kde-config/g' ./profile/packages.x86_64

	util_error_echo "cat ./asset/overlay-build/packages.x86_64.part.txt >> ./profile/packages.x86_64"
	cat ./asset/overlay-build/packages.x86_64.part.txt >> ./profile/packages.x86_64

	util_error_echo

}

mod_iso_profile_overlay_locale () {

	util_error_echo

	util_error_echo "install -Dm644 ./asset/overlay/etc/locale.conf ./profile/airootfs/etc/locale.conf"
	install -Dm644 ./asset/overlay/etc/locale.conf ./profile/airootfs/etc/locale.conf


	#util_error_echo "install -Dm644 ./asset/overlay/etc/locale.gen ./profile/airootfs/etc/locale.gen"
	#install -Dm644 ./asset/overlay/etc/locale.gen ./profile/airootfs/etc/locale.gen
	
	util_error_echo "install -Dm644 ./asset/overlay/etc/pacman.d/hooks/40-locale-gen.hook ./profile/airootfs/etc/pacman.d/hooks/40-locale-gen.hook"
	install -Dm644 ./asset/overlay/etc/pacman.d/hooks/40-locale-gen.hook ./profile/airootfs/etc/pacman.d/hooks/40-locale-gen.hook

	util_error_echo
}

mod_iso_profile_overlay_bashrc () {

	util_error_echo

	util_error_echo "install -Dm644 ./asset/overlay/etc/skel/.bashrc ./profile/airootfs/etc/skel/.bashrc"
	install -Dm644 ./asset/overlay/etc/skel/.bashrc ./profile/airootfs/etc/skel/.bashrc

	util_error_echo
}


mod_iso_profile_overlay_sddm_conf () {

	util_error_echo

	util_error_echo "sed -i 's/^Numlock=on/Numlock=/g' ./profile/airootfs/etc/sddm.conf"
	sed -i 's/^Numlock=on/Numlock=/g' ./profile/airootfs/etc/sddm.conf


	util_error_echo "sed -i 's/^Numlock=on/Numlock=/g' ./profile/airootfs/etc/sddm.conf.d/kde_settings.conf"
	sed -i 's/^Numlock=on/Numlock=/g' ./profile/airootfs/etc/sddm.conf.d/kde_settings.conf

	util_error_echo

}

##
### Tail: Model / Build ISO / Overlay Profile
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




