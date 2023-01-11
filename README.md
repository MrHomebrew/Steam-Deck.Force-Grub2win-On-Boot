# Steam-Deck.Force-Grub2win-On-Boot
When Dual Booting, This Script will Force Grub2win to Boot when Powering on rather than Windows


# How Does this work?

A systemd service is installed that tells the system to launch Grub2win on the next boot (as seen in `efibootmgr`).

Updated Script will now set `BootNext` (the next OS to boot) to `CurrentBoot` (the OS you are currently in aka Grub2win)

# Install (via Curl) (Window EFI Rename)

In Konsole type `curl -sSL https://raw.githubusercontent.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/main/Window_EFI_Rename.sh | bash`


# Install (via Curl) (Systemd Service + Window EFI Rename)

In Konsole type `curl -sSL https://raw.githubusercontent.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/main/curl_install.sh | bash`


# Uninstall

Rename bootmgfw-orig.efi back to bootmgfw.efi

`sudo sh -c "cd /mnt; sudo mv /esp/efi/Microsoft/boot/bootmgfw-orig.efi /esp/efi/Microsoft/boot/bootmgfw.efi"`

Simply Delete the service

`sudo rm /etc/systemd/system/force-grub2win-on-next-boot.service`

# Found a Bug?

Please add to the `issues` tab! https://github.com/MrHomebrew/Steam-Deck.Force-Grub2win-On-Boot/issues

# "This is cool! How can I thank you?"
### Why not drop me a sub over on my youtube channel ;) [MrHomebrew](https://youtube.com/@JasonLeonidas?sub_confirmation=1)

