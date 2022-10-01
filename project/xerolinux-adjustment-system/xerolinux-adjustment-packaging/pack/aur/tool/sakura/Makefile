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
## * https://wiki.archlinux.org/title/Arch_User_Repository
## * https://archlinux.org/groups/x86_64/base-devel/
## * https://wiki.archlinux.org/title/pacman
## * https://wiki.archlinux.org/title/PKGBUILD
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
	sudo pacman -R sakura
.PHONY: uninstall

clean:
	rm -rf package
	rm -rf tmp
.PHONY: clean


list:
	pacman -Ql sakura -q
.PHONY: list

info:
	pacman -Qi sakura
.PHONY: info
