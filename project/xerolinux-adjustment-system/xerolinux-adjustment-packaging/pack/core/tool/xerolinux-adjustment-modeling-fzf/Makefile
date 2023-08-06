default: help
.PHONY: default

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make prepare'
	@echo
	@echo '	$$ make build'
	@echo
	@echo '	$$ make install'
	@echo

.PHONY: help


##
## * https://wiki.archlinux.org/title/Creating_packages
## * https://wiki.archlinux.org/title/Arch_User_Repository
## * https://archlinux.org/groups/x86_64/base-devel/
## * https://wiki.archlinux.org/title/pacman
## * https://wiki.archlinux.org/title/makepkg
## * https://wiki.archlinux.org/title/PKGBUILD
## * https://wiki.archlinux.org/title/Arch_package_guidelines
##


prepare:
	sudo pacman -Sy --needed base-devel
.PHONY: prepare


build:
	./build.sh
.PHONY: build


install:
#	sudo pacman -U --needed *.zst
	sudo pacman -U --needed package/*.zst
.PHONY: install


reinstall:
#	sudo pacman -U *.zst
	sudo pacman -U package/*.zst
.PHONY: reinstall


uninstall:
	sudo pacman -R xerolinux-adjustment-modeling-fzf
.PHONY: uninstall

clean:
	rm -f *.zst
	rm -rf pkg
	rm -rf src
	rm -rf package
.PHONY: clean


list:
	pacman -Ql xerolinux-adjustment-modeling-fzf -q
.PHONY: list

info:
	pacman -Qi xerolinux-adjustment-modeling-fzf
.PHONY: info
