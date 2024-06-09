#!/bin/bash

echo "Hapus instalan PI-Pwn/STB-Pwn? (Y|N)"
read -r delete_choice
if [ "$delete_choice" == "Y" ] || [ "$delete_choice" == "y" ]; then
    sudo systemctl stop pipwn && sudo systemctl disable pipwn
    sudo rm -f /etc/systemd/system/pipwn.service && sudo rm -f /usr/lib/systemd/system/pipwn.service
    sudo rm -rf /boot/firmware/PPPwn
    sudo rm -rf PI-Pwn STB-Pwn
    sudo sed -i 's^sudo bash /boot/firmware/PPPwn/devboot.sh \&^^g' /etc/rc.local
    echo "Hapus instalan berhasil. Muat ulang sekarang? (Y|N)"
    read -r reboot_choice
    if [ "$reboot_choice" == "Y" ] || [ "$reboot_choice" == "y" ]; then
        echo "Memulai muat ulang."
        sudo reboot
    elif [ "$reboot_choice" == "N" ] || [ "$reboot_choice" == "n" ]; then
        echo "Muat ulang dibatalkan."
        sudo systemctl daemon-reload
        exit 0
    else
        echo "Input tidak valid. Keluar dari skrip."
        exit 1
    fi
elif [ "$delete_choice" == "N" ] || [ "$delete_choice" == "n" ]; then
    echo "Batal hapus instalan."
    exit 0
else
    echo "Input tidak valid. Keluar dari skrip."
    exit 1
fi
