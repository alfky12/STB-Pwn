#!/bin/bash

echo -e '\033[36mMenghentikan pipwn service\033[0m'
sudo systemctl stop pipwn
sleep 2
sudo find /boot/firmware/PPPwn ! -name 'config.sh' ! -name 'PPPwn' -exec rm -rf {} +
echo -e '\033[36mUnduh skrip PI-Pwn terbaru\033[0m'
cd PI-Pwn && git pull
sudo cp -r PPPwn /boot/firmware && cd /boot/firmware/PPPwn
echo -e '\033[36mMulai pembaruan\033[0m'
sudo chmod 777 *
sudo bash install.sh
