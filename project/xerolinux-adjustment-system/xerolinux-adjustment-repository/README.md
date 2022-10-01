# xerolinux-adjustment-repository

* [xerolinux-adjustment-packaging](https://github.com/samwhelp/xerolinux-adjustment/iso-build-system/xerolinux-adjustment-packaging)
* [xerolinux-adjustment-repository](https://github.com/samwhelp/xerolinux-adjustment/iso-build-system/xerolinux-adjustment-repository)


## Use Remote

* /etc/pacman.conf

``` ini
[xerolinux-adjustment]
SigLevel = Optional TrustAll
Server = https://samwhelp.github.io/xerolinux-adjustment-repository/repo/main
```

run

``` sh
sudo pacman -Sy
```

run

``` sh
sudo pacman -S xerolinux-adjustment-hello
```


## Use Local

run to clone

``` sh
sudo mkdir -p /opt/xerolinux-adjustment/
sudo chmod 777 /opt/xerolinux-adjustment/
git clone https://github.com/samwhelp/xerolinux-adjustment.git

mkdir -p /opt/xerolinux-adjustment/iso-build-system
cp ./xerolinux-adjustment/iso-build-system/. /opt/xerolinux-adjustment/iso-build-system
```


* /etc/pacman.conf

``` ini
[xerolinux-adjustment]
SigLevel = Optional TrustAll
Server = file:///opt/xerolinux-adjustment/iso-build-system/xerolinux-adjustment-repository/repo/main
```


run

``` sh
sudo pacman -Sy
```

run

``` sh
sudo pacman -S xerolinux-adjustment-hello
```


## Use Include

* [/etc/pacman.d/xerolinux-adjustment-mirrorlist](https://github.com/samwhelp/xerolinux-adjustment/blob/main/xerolinux-adjustment-packaging/pack/base/xerolinux-adjustment-mirrorlist/asset/etc/pacman.d/xerolinux-adjustment-mirrorlist)

```
Server = file:///opt/xerolinux-adjustment/iso-build/system/xerolinux-adjustment-repository/repo/main
```

* /etc/pacman.conf

``` ini
[xerolinux-adjustment]
SigLevel = Optional TrustAll
Include = /etc/pacman.d/xerolinux-adjustment-mirrorlist
```

run

``` sh
sudo pacman -Sy
```

run

``` sh
sudo pacman -S xerolinux-adjustment-hello
```


## list xerolinux-adjustment

``` sh
pacman -Sl xerolinux-adjustment
```

