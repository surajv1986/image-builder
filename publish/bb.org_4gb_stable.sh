#!/bin/bash -e

time=$(date +%Y-%m-%d)
DIR="$PWD"

export apt_proxy=apt-proxy:3142/

debian_lxde_4gb_stable="debian-7.8-lxde-4gb-armhf-${time}"

options="--img-4gb bone-${debian_lxde_4gb_stable} --dtb beaglebone \
--beagleboard.org-production --boot_label BEAGLEBONE --enable-systemd \
--bbb-old-bootloader-in-emmc --hostname beaglebone"

./RootStock-NG.sh -c bb.org-debian-stable-4gb

if [ -d ./deploy/${debian_lxde_4gb_stable} ] ; then
	cd ./deploy/${debian_lxde_4gb_stable}/
	sudo ./setup_sdcard.sh ${options}
	mv *.img ../
fi

