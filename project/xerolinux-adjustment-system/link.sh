#!/usr/bin/env bash

THE_TARGET_DIR_PATH="$(pwd)"
THE_ISO_BUILD_SYSTEM_DIR_PATH="/opt/xerolinux-adjustment/iso-build-system"

sudo mkdir -p "${THE_ISO_BUILD_SYSTEM_DIR_PATH}"
sudo chmod 777 "${THE_ISO_BUILD_SYSTEM_DIR_PATH}"


cd "${THE_ISO_BUILD_SYSTEM_DIR_PATH}"

test -e xerolinux-adjustment-packaging || ln -sf "${THE_TARGET_DIR_PATH}/xerolinux-adjustment-packaging" xerolinux-adjustment-packaging
test -e xerolinux-adjustment-repository || ln -sf "${THE_TARGET_DIR_PATH}/xerolinux-adjustment-repository" xerolinux-adjustment-repository
test -e xerolinux-adjustment-iso-profile || ln -sf "${THE_TARGET_DIR_PATH}/xerolinux-adjustment-iso-profile" xerolinux-adjustment-iso-profile

file $(ls -1)

cd "${OLDPWD}"



