#!/bin/bash

echo -e '\033[36mHapus instalan PI-Pwn/STB-Pwn? (Y|N)\033[0m'
read -r delete_choice
if [ "$delete_choice" == "Y" ] || [ "$delete_choice" == "y" ]; then
    sudo systemctl stop pipwn && sudo systemctl disable pipwn
    sudo rm -f /etc/systemd/system/pipwn.service && sudo rm -f /usr/lib/systemd/system/pipwn.service
    sudo rm -rf /boot/firmware/PPPwn
    sudo rm -rf PI-Pwn STB-Pwn
    sudo sed -i 's^sudo bash /boot/firmware/PPPwn/devboot.sh \&^^g' /etc/rc.local
    echo -e '\033[36mHapus instalan berhasil. Muat ulang sekarang? (Y|N)\033[0m'
    read -r reboot_choice
    if [ "$reboot_choice" == "Y" ] || [ "$reboot_choice" == "y" ]; then
        echo -e '\033[36mMemuat ulang.\033[0m'
        sudo reboot
    elif [ "$reboot_choice" == "N" ] || [ "$reboot_choice" == "n" ]; then
        echo -e '\033[36mMuat ulang dibatalkan.\033[0m'
        sudo systemctl daemon-reload
        exit 0
    else
        echo -e '\033[36mInput tidak valid. Keluar dari skrip.\033[0m'
        exit 1
    fi
elif [ "$delete_choice" == "N" ] || [ "$delete_choice" == "n" ]; then
    echo -e '\033[36mBatal hapus instalan.\033[0m'
    exit 0
else
    echo -e '\033[36mInput tidak valid. Keluar dari skrip.\033[0m'
    exit 1
fi
