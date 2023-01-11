#!/bin/bash
#Steam Deck Force-Grub2win-On-Boot by MrHomebrew
#License: DBAD: https://github.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/blob/main/LICENSE.md
#Source: https://github.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot
# Use at own Risk!

#curl -sSL https://raw.githubusercontent.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/main/curl_install.sh | bash

#stop running script if anything returns an error (non-zero exit )
set -e

repo_url="https://raw.githubusercontent.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/main"

tmp_dir="/tmp/MrHomebrew.SDFG2WB.install"

service_install_dir="/etc/systemd/system"

zenity --question --width=400 \
  --text="Read $repo_url/README.md before proceeding. \
\nDo you want to install the Force-Grub2win-On-Boot service?"
if [ "$?" != 0 ]; then
  #NOTE: This code will never be reached due to "set -e", the system will already exit for us but just incase keep this
  echo "bye then! xxx"
  exit 0;
fi

echo "Making tmp folder $tmp_dir"
mkdir -p "$tmp_dir"

echo "Downloading Required Files"
curl -o "$tmp_dir/force-grub2win-on-next-boot.service" "$repo_url/force-grub2win-on-next-boot.service"

echo "Copying $tmp_dir/force-grub2win-on-next-boot.service to $service_install_dir/force-grub2win-on-next-boot.service"
sudo cp "$tmp_dir/force-grub2win-on-next-boot.service" "$service_install_dir/force-grub2win-on-next-boot.service"

echo "Starting Service"
sudo systemctl enable --now force-grub2win-on-next-boot.service

echo "Starting rename of Microsoft to Deck"
mount /dev/nvme0n1p1 /mnt
cd /mnt
mv /esp/efi/Microsoft /esp/efi/Deck

echo "Done."
