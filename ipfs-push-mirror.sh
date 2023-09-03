#!/bin/bash
DIALOG_CANCEL=1
DIALOG_ESC=255
message=$(whiptail --title "Mirror push commit" \
	           --inputbox "Enter your commit message to push icepearl (GitLab) and icepearl-mirror (GitHub):" 10 60 \
	           3>&1 1>&2 2>&3)
exit_status=$?
case $exit_status in
    $DIALOG_CANCEL) exit ;;
    $DIALOG_ESC) exit 1 ;;
esac
git add .
git commit -a -m "$message"
git push
git push --mirror git@github.com:icepearl-mirror/ipfs.git
