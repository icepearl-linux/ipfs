#!/bin/bash -e
DIALOG_CANCEL=1
DIALOG_ESC=255
while true
do
    exec 3>&1
    selection=$(whiptail --title "IPFS Build Menu" \
	                 --menu "Execute the build script" 0 0 10 \
		         "1" "Build and install to hard disk" \
		         "2" "Build rootfs tarball" \
		         "3" "Build ISO" \
		         2>&1 1>&3)
    exit_status=$?
    exec 3>&-
    case $exit_status in
	$DIALOG_CANCEL) exit ;;
	$DIALOG_ESC) exit 1 ;;
    esac
    case $selection in
	1) ./build/build-install-hdd.sh ;;
	2) ./build/tarball.sh ;;
	3) ./build/iso.sh ;;
    esac
done
