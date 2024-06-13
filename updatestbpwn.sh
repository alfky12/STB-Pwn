#!/bin/bash

PI_PWN_DIR="$HOME/PI-Pwn"
STB_PWN_DIR="$HOME/STB-Pwn"
echo -e '\033[36mMenghentikan pipwn service\033[0m'
sleep 2
sudo systemctl stop pipwn
sudo find /boot/firmware/PPPwn ! -name 'config.sh' ! -name 'PPPwn' -exec rm -rf {} +
if [ -d "$PI_PWN_DIR" ]; then
    echo -e '\033[36mMengunduh skrip PI-Pwn terbaru\033[0m'
    cd "$PI_PWN_DIR"
    git pull
fi
if [ -d "$STB_PWN_DIR" ]; then
    echo -e '\033[36mMengunduh skrip STB-Pwn terbaru\033[0m'
    cd "$STB_PWN_DIR"
    git pull
fi
if [ -d "$PI_PWN_DIR" ] && [ -d "$STB_PWN_DIR" ]; then
    echo "Terdapat folder PI-Pwn dan STB-Pwn, pilih tindakan:"
    echo "1. Update PI-Pwn"
    echo "2. Update STB-Pwn"
    read -p "Masukkan pilihan (1 atau 2): " choice
    case $choice in
        1)
            cd "$PI_PWN_DIR"
            git pull
            ;;
        2)
            cd "$STB_PWN_DIR"
            git pull
            ;;
        *)
            echo "Pilihan tidak valid. Keluar."
            ;;
    esac
fi
sudo cp -r PPPwn /boot/firmware && cd /boot/firmware/PPPwn
echo -e '\033[36mMemulai pembaruan\033[0m'
sleep 2
sudo chmod 777 *
sudo bash install.sh
