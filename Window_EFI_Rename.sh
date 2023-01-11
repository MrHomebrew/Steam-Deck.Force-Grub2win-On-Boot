#!/bin/bash

#Steam Deck Force-Grub2win-On-Boot by MrHomebrew

#License: DBAD: https://github.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/blob/main/LICENSE.md

#Source: https://github.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot

# Use at own Risk!

#curl -sSL https://raw.githubusercontent.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/main/Window_EFI_Rename.sh | bash

#stop running script if anything returns an error (non-zero exit )

repo_url="https://raw.githubusercontent.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/main"

zenity --question --width=400 \
  --text="Read $repo_url/README.md before proceeding. \
\nDo you want to rename the bootmgfw.efi file in esp/efi/Microsoft/boot partition directory to bootmgfw-orig.efi?"
if [ "$?" != 0 ]; then
  #NOTE: This code will never be reached due to "set -e", the system will already exit for us but just incase keep this
  echo "bye then! xxx"
  exit 0;
fi

echo "Starting rename of bootmgfw.efi file to bootmgfw-orig.efi"

sudo sh -c "cd /mnt; sudo mv /esp/efi/Microsoft/boot/bootmgfw.efi /esp/efi/Microsoft/boot/bootmgfw-orig.efi"

echo "Done."
